import '../../../utils/native_type.dart';
import '../../generated_bindings.dart' as raylib;
import '../raylib.dart';

typedef Texture2D = Texture;

typedef TextureCubemap = Texture;

class Texture extends NativeClass<raylib.Texture> {
  Texture.fromRef(super.ref) : super.fromRef();

  PixelFormat get format => pixelFormatToDart(ref.format);

  int get height => ref.height;

  int get id => ref.id;

  int get mipmaps => ref.mipmaps;

  int get width => ref.width;
}
