import 'dart:ffi';
import 'dart:math';

import 'package:ffi/ffi.dart';

import '../../../utils/native_type.dart';
import '../../generated_bindings.dart' as raylib;

class Vector2 extends NativeClass<raylib.Vector2> {
  final Pointer<raylib.Vector2>? pointer;

  Vector2(double x, double y)
    : pointer = malloc<raylib.Vector2>(sizeOf<raylib.Vector2>()) {
    ref = pointer!.ref;
    this.x = x;
    this.y = y;
  }

  Vector2.all(double value) : this(value, value);

  Vector2.fromRef(super.ref) : pointer = null, super.fromRef();

  Vector2.zero() : this.all(0);

  double get length => sqrt((x * x) + (y * y));

  double get lengthSqr => (x * x) + (y * y);

  double get x => ref.x;
  set x(double x) => ref.x = x;

  double get y => ref.y;

  set y(double y) => ref.y = y;

  double angle(Vector2 v) {
    final result = atan2(v.y - y, v.x - x) * (180 / pi);
    if (result < 0) return result + 360;
    return result;
  }

  double distance(Vector2 v) {
    return sqrt((x - v.x) * (x - v.x) + (y - v.y) * (y - v.y));
  }

  double dot(Vector2 v) => x * v.x + y * v.y;

  @override
  String toString() => 'Vector2 { $x, $y }';
}
