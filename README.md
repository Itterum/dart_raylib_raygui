# Dart + Raylib + Raygui

[English](README.md) | [Русский](README_ru.md)

## Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/Itterum/dart_raylib_raygui.git
   cd dart_raylib_raygui
   ```

2. Build the DLL:
   ```bash
   dart run build_raylib_raygui.dart
   ```

3. (Optional) Regenerate bindings:
   ```bash
   dart run ffigen
   ```

4. Set DLL path in bin/main.dart:
   ```dart
   initLibrary(windows: 'native\\build\\raylib_raygui.dll');
   ```

5. Run the app:
   ```bash
   dart run bin/main.dart
   ```
