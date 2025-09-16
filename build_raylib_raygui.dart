import 'dart:io';
import 'package:path/path.dart' as p;

const raylibRepo = 'https://github.com/raysan5/raylib.git';
const rayguiRepo = 'https://github.com/raysan5/raygui.git';

final nativeDir = p.join(Directory.current.path, 'native');
final raylibDir = p.join(nativeDir, 'raylib');
final rayguiDir = p.join(nativeDir, 'raygui');
final buildDir = p.join(nativeDir, 'build');

Future<void> run(List<String> cmd, {String? cwd}) async {
  print('>> ${cmd.join(" ")}');
  final result = await Process.run(
    cmd.first,
    cmd.sublist(1),
    workingDirectory: cwd,
    runInShell: true,
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);
  if (result.exitCode != 0) {
    throw Exception('Command failed: ${cmd.join(" ")}');
  }
}

Future<void> cloneRepo(String repoUrl, String destDir) async {
  if (Directory(destDir).existsSync()) {
    print('$destDir уже существует, пропускаю clone');
  } else {
    print('Cloning $repoUrl to $destDir');
    await run(['git', 'clone', repoUrl, destDir]);
  }
}

void copyDirectory(Directory source, Directory destination) {
  if (!destination.existsSync()) {
    destination.createSync(recursive: true);
  }
  for (var entity in source.listSync(recursive: false)) {
    if (entity is File) {
      final newPath = p.join(destination.path, p.basename(entity.path));
      entity.copySync(newPath);
    } else if (entity is Directory) {
      final newDir = Directory(
        p.join(destination.path, p.basename(entity.path)),
      );
      copyDirectory(entity, newDir);
    }
  }
}

Future<void> prepareBuild() async {
  final build = Directory(buildDir);
  if (build.existsSync()) {
    build.deleteSync(recursive: true);
  }
  build.createSync(recursive: true);

  copyDirectory(Directory(p.join(raylibDir, 'src')), build);

  File(
    p.join(rayguiDir, 'src', 'raygui.h'),
  ).copySync(p.join(buildDir, 'raygui.h'));

  final rayguiCPath = p.join(buildDir, 'raygui.c');
  File(rayguiCPath).writeAsStringSync('''
#define RAYGUI_IMPLEMENTATION
#include "raygui.h"
''');
  print('Создан: $rayguiCPath');
}

Future<void> buildLibrary() async {
  final files = [
    'rcore.c',
    'rshapes.c',
    'rtextures.c',
    'rtext.c',
    'rmodels.c',
    'raudio.c',
    'utils.c',
    'rglfw.c',
    'raygui.c',
  ];

  final os = Platform.operatingSystem;
  final outputName = os == 'windows' ? 'raylib_raygui.dll' : 'libraylib_raygui.so';

  final cmd = <String>[
    'gcc',
    '-shared',
    '-fPIC',
    '-o',
    outputName,
    ...files,
    '-I.',
    '-Iexternal/glfw/include',
    '-DPLATFORM_DESKTOP',
    '-DGRAPHICS_API_OPENGL_33',
  ];

  if (os == 'windows') {
    cmd.addAll([
      '-lopengl32',
      '-lgdi32',
      '-lwinmm',
      '-static-libgcc',
      '-Wl,--export-all-symbols',
    ]);
  } else if (os == 'linux') {
    cmd.addAll([
      '-lGL',
      '-lm',
      '-lpthread',
      '-ldl',
      '-lrt',
      '-lX11',
      '-D_GLFW_X11',
    ]);
  } else {
    throw Exception('Unsupported OS: $os');
  }

  await run(cmd, cwd: buildDir);
}

Future<void> main() async {
  if (!Directory(nativeDir).existsSync()) {
    Directory(nativeDir).createSync(recursive: true);
  }

  await cloneRepo(raylibRepo, raylibDir);
  await cloneRepo(rayguiRepo, rayguiDir);

  await prepareBuild();
  await buildLibrary();
}
