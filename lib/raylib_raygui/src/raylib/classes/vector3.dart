import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../../utils/native_type.dart';
import '../../generated_bindings.dart' as raylib;

class Vector3 extends NativeClass<raylib.Vector3> {
  final Pointer<raylib.Vector3>? pointer;

  Vector3(double x, double y, double z)
    : pointer = malloc<raylib.Vector3>(sizeOf<raylib.Vector3>()) {
    ref = pointer!.ref;
    this.x = x;
    this.y = y;
    this.z = z;
  }

  Vector3.all(double value) : this(value, value, value);

  Vector3.fromRef(super.ref) : pointer = null, super.fromRef();

  Vector3.zero() : this.all(0);

  double get x => ref.x;
  set x(double x) => ref.x = x;

  double get y => ref.y;
  set y(double y) => ref.y = y;

  double get z => ref.z;
  set z(double z) => ref.z = z;

  @override
  String toString() => 'Vector3 { $x, $y, $z }';
}
