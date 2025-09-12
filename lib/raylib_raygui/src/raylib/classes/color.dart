import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../../utils/native_type.dart';
import '../../generated_bindings.dart' as raylib;

class Color extends NativeClass<raylib.Color> {
  static final lightGray = Color(200, 200, 200, 255);

  static final gray = Color(130, 130, 130, 255);

  static final darkGray = Color(80, 80, 80, 255);

  static final yellow = Color(253, 249, 0, 255);

  static final gold = Color(255, 203, 0, 255);

  static final orange = Color(255, 161, 0, 255);

  static final pink = Color(255, 109, 194, 255);

  static final red = Color(230, 41, 55, 255);

  static final maroon = Color(190, 33, 55, 255);

  static final green = Color(0, 228, 48, 255);

  static final lime = Color(0, 158, 47, 255);

  static final darkGreen = Color(0, 117, 44, 255);

  static final skyBlue = Color(102, 191, 255, 255);

  static final blue = Color(0, 121, 241, 255);

  static final darkBlue = Color(0, 82, 172, 255);

  static final purple = Color(200, 122, 255, 255);

  static final voilet = Color(135, 60, 190, 255);

  static final darkPurple = Color(112, 31, 126, 255);

  static final beige = Color(211, 176, 131, 255);

  static final brown = Color(127, 106, 79, 255);

  static final darkBrown = Color(76, 63, 47, 255);

  static final white = Color(255, 255, 255, 255);

  static final black = Color(0, 0, 0, 255);

  static final blank = Color(0, 0, 0, 0);

  static final magenta = Color(255, 0, 255, 255);

  static final rayWhite = Color(245, 245, 245, 255);

  final Pointer<raylib.Color>? pointer;

  Color(int r, int g, int b, int a)
    : pointer = malloc<raylib.Color>(sizeOf<raylib.Color>()) {
    ref = pointer!.ref;
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }

  Color.fromRef(super.ref) : pointer = null, super.fromRef();

  int get a => ref.a;

  set a(int alpha) => ref.a = alpha;

  int get b => ref.b;

  set b(int blue) => ref.b = blue;

  int get g => ref.g;

  set g(int green) => ref.g = green;

  int get r => ref.r;

  set r(int red) => ref.r = red;
}
