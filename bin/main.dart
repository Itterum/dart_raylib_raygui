import 'package:dart_raylib_raygui/raylib_raygui/raylib_raygui.dart';

void main() {
  initLibrary(windows: 'native\\build\\raylib_raygui.dll');

  initWindow(800, 600, 'Dart Raylib Raygui');

  while (!windowShouldClose()) {
    beginDrawing();

    final buttonWidth = 200.0;
    final buttonHeight = 50.0;

    final screenWidth = getScreenWidth().toDouble();
    final screenHeight = getScreenHeight().toDouble();

    final x = (screenWidth - buttonWidth) / 2;
    final y = (screenHeight - buttonHeight) / 2;

    guiButton(Rectangle(x, y, buttonWidth, buttonHeight), 'Click Me');

    endDrawing();
  }

  closeWindow();
}
