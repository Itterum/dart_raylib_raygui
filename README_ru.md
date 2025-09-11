# Dart + Raylib + Raygui

[English](README.md) | [Русский](README_ru.md)

## Инструкция

1. Склонировать репозиторий:
   ```bash
   git clone https://github.com/Itterum/dart_raylib_raygui.git
   cd dart_raylib_raygui
   ```

2. Собрать DLL:
   ```bash
   uv run build_raylib_raygui.py
   ```

3. (Опционально) Сгенерировать биндинги:
   ```bash
   dart run ffigen
   ```

4. Прописать путь к DLL в bin/main.dart:
   ```dart
   initLibrary(windows: 'native\\build\\raylib_raygui.dll');
   ```

5. Запустить приложение::
   ```bash
   dart run bin/main.dart
   ```
