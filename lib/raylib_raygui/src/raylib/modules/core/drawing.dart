import '../../../library.dart';
import '../../raylib.dart';

void beginBlendMode(BlendMode mode) {
  return library.BeginBlendMode(blendModeToNative(mode));
}

void beginDrawing() {
  return library.BeginDrawing();
}

void beginMode2D(Camera2D camera) {
  return library.BeginMode2D(camera.ref);
}

void beginMode3D(Camera3D camera) {
  return library.BeginMode3D(camera.ref);
}

void beginScissorMode(int x, int y, int width, int height) {
  return library.BeginScissorMode(x, y, width, height);
}

void beginShaderMode(Shader shader) {
  return library.BeginShaderMode(shader.ref);
}

void beginTextureMode(RenderTexture2D target) {
  return library.BeginTextureMode(target.ref);
}

void clearBackground(Color color) {
  return library.ClearBackground(color.ref);
}

void endBlendMode() {
  return library.EndBlendMode();
}

void endDrawing() {
  return library.EndDrawing();
}

void endMode2D() {
  return library.EndMode2D();
}

void endMode3D() {
  return library.EndMode3D();
}

void endScissorMode() {
  return library.EndScissorMode();
}

void endShaderMode() {
  return library.EndShaderMode();
}

void endTextureMode() {
  return library.EndTextureMode();
}
