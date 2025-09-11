import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../../generated_bindings.dart' as raylib;
import '../../../library.dart';

void beginDrawing() {
  library.BeginDrawing();
}

void clearBackground(raylib.Color color) {
  library.ClearBackground(color);
}

void closeWindow() {
  library.CloseWindow();
}

void endDrawing() {
  library.EndDrawing();
}

int getScreenHeight() {
  return library.GetScreenHeight();
}

int getScreenWidth() {
  return library.GetScreenWidth();
}

void initWindow(int width, int height, String title) {
  return library.InitWindow(width, height, title.toNativeUtf8().cast<Char>());
}

bool isWindowFullscreen() {
  return library.IsWindowFullscreen();
}

bool isWindowHidden() {
  return library.IsWindowHidden();
}

bool isWindowMaximized() {
  return library.IsWindowMaximized();
}

bool isWindowMinimized() {
  return library.IsWindowMinimized();
}

bool isWindowReady() {
  return library.IsWindowReady();
}

bool windowShouldClose() {
  return library.WindowShouldClose();
}
