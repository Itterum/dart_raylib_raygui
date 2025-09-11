import 'dart:ffi';
import 'dart:io';

import 'generated_bindings.dart' as raylib;

raylib.Raylib? _library;

raylib.Raylib get library {
  if (_library == null) {
    throw Exception(
      'Raylib has not been initialized, did you call initLibrary()?',
    );
  }
  return _library!;
}

set library(raylib.Raylib lib) => _library = lib;

void initLibrary({String? linux, String? windows}) {
  String libraryPath = switch (Platform.operatingSystem) {
    'linux' =>
      linux ??
          (throw Exception(
            'Running on linux but no library path was provided',
          )),
    'windows' =>
      windows ??
          (throw Exception(
            'Running on windows but no library path was provided',
          )),
    _ => throw UnsupportedError('''
                                Platform ${Platform.operatingSystem} is untested and therefore unsupported.
                                Please file a bug report if you think this is incorrect
                                '''),
  };

  library = raylib.Raylib(DynamicLibrary.open(libraryPath));
}
