import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../../utils/native_type.dart';
import '../../generated_bindings.dart' as raylib;

class Rectangle extends NativeClass<raylib.Rectangle> {
  final Pointer<raylib.Rectangle>? pointer;

  Rectangle(double x, double y, double width, double height)
    : pointer = malloc<raylib.Rectangle>(sizeOf<raylib.Rectangle>()) {
    ref = pointer!.ref;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  Rectangle.fromRef(super.ref) : pointer = null, super.fromRef();

  double get height => ref.height;
  set height(double height) => ref.height = height;

  double get width => ref.width;
  set width(double width) => ref.width = width;

  double get x => ref.x;
  set x(double x) => ref.x = x;

  double get y => ref.y;
  set y(double y) => ref.y = y;
}
