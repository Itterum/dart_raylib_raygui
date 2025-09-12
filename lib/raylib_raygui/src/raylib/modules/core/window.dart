import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../../generated_bindings.dart' as raylib;
import '../../../library.dart';
import '../../raylib.dart';

void clearWindowState(int flags) {
  return library.ClearWindowState(flags);
}

void closeWindow() {
  return library.CloseWindow();
}

String getClipboardText() {
  return library.GetClipboardText().toString();
}

int getCurrentMonitor() {
  return library.GetCurrentMonitor();
}

int getMonitorCount() {
  return library.GetMonitorCount();
}

int getMonitorHeight(int monitor) {
  return library.GetMonitorHeight(monitor);
}

String getMonitorName(int monitor) {
  return library.GetMonitorName(monitor).toString();
}

int getMonitorPhysicalHeight(int monitor) {
  return library.GetMonitorPhysicalHeight(monitor);
}

int getMonitorPhysicalWidth(int monitor) {
  return library.GetMonitorPhysicalWidth(monitor);
}

Vector2 getMonitorPosition(int monitor) {
  return Vector2.fromRef(library.GetMonitorPosition(monitor));
}

int getMonitorRefreshRate(int monitor) {
  return library.GetMonitorRefreshRate(monitor);
}

int getMonitorWidth(int monitor) {
  return library.GetMonitorWidth(monitor);
}

int getScreenHeight() {
  return library.GetScreenHeight();
}

int getScreenWidth() {
  return library.GetScreenWidth();
}

Vector2 getWindowPosition() {
  return Vector2.fromRef(library.GetWindowPosition());
}

Vector2 getWindowScaleDPI() {
  return Vector2.fromRef(library.GetWindowScaleDPI());
}

void initWindow(int width, int height, String title) {
  return library.InitWindow(width, height, title.toNativeUtf8().cast<Char>());
}

bool isWindowFocused() {
  return library.IsWindowFocused();
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

bool isWindowResized() {
  return library.IsWindowResized();
}

bool isWindowState(int flag) {
  return library.IsWindowState(flag);
}

void maximizeWindow() {
  return library.MaximizeWindow();
}

void minimizeWindow() {
  return library.MinimizeWindow();
}

void restoreWindow() {
  return library.RestoreWindow();
}

void setClipboardText(String text) {
  return library.SetClipboardText(text.toNativeUtf8().cast<Char>());
}

void setWindowIcon(raylib.Image image) {
  return library.SetWindowIcon(image);
}

void setWindowMinSize(int width, int height) {
  return library.SetWindowMinSize(width, height);
}

void setWindowMonitor(int monitor) {
  return library.SetWindowMonitor(monitor);
}

void setWindowPosition(int x, int y) {
  return library.SetWindowPosition(x, y);
}

void setWindowSize(int width, int height) {
  return library.SetWindowSize(width, height);
}

void setWindowState(int flags) {
  return library.SetWindowState(flags);
}

void setWindowTitle(String title) {
  return library.SetWindowTitle(title.toNativeUtf8().cast<Char>());
}

void toggleFullscreen() {
  return library.ToggleFullscreen();
}

bool windowShouldClose() {
  return library.WindowShouldClose();
}
