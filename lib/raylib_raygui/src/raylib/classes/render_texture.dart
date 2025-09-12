import '../../../utils/native_type.dart';
import '../../generated_bindings.dart' as raylib;
import '../raylib.dart';

typedef RenderTexture2D = RenderTexture;

class RenderTexture extends NativeClass<raylib.RenderTexture> {
  RenderTexture.fromRef(super.ref) : super.fromRef();

  Texture get depth => Texture.fromRef(ref.depth);

  int get id => ref.id;

  Texture get texture => Texture.fromRef(ref.texture);
}
