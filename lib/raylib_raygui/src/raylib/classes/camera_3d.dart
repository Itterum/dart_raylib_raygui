import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../../utils/native_type.dart';
import '../../generated_bindings.dart' as raylib;
import '../raylib.dart';

typedef Camera = Camera3D;

class Camera3D extends NativeClass<raylib.Camera3D> {
  final Pointer<raylib.Camera3D> pointer;

  Camera3D({
    Vector3? position,
    Vector3? target,
    Vector3? up,
    double fovy = 1,
    CameraProjection projection = CameraProjection.perspective,
  }) : pointer = malloc<raylib.Camera3D>(sizeOf<raylib.Camera3D>()) {
    position ??= Vector3.zero();
    target ??= Vector3.zero();
    up ??= Vector3.zero();

    ref = pointer.ref;
    this.position = position;
    this.target = target;
    this.up = up;
    this.fovy = fovy;
    this.projection = projection;
  }

  double get fovy => ref.fovy;
  set fovy(double fovy) => ref.fovy = fovy;

  Vector3 get position => Vector3.fromRef(ref.position);
  set position(Vector3 position) {
    ref.position.x = position.x;
    ref.position.y = position.y;
    ref.position.z = position.z;
  }

  CameraProjection get projection {
    switch (ref.projection) {
      case 0:
        return CameraProjection.perspective;
      case 1:
        return CameraProjection.orthographic;
      default:
        throw Exception('Unsupported projection: ${ref.projection}');
    }
  }

  set projection(CameraProjection projection) {
    switch (projection) {
      case CameraProjection.perspective:
        ref.projection = 0;
        break;
      case CameraProjection.orthographic:
        ref.projection = 1;
        break;
    }
  }

  Vector3 get target => Vector3.fromRef(ref.target);
  set target(Vector3 target) {
    ref.target.x = target.x;
    ref.target.y = target.y;
    ref.target.z = target.z;
  }

  Vector3 get up => Vector3.fromRef(ref.up);

  set up(Vector3 up) {
    ref.up.x = up.x;
    ref.up.y = up.y;
    ref.up.z = up.z;
  }

  @override
  String toString() {
    return 'Camera3D { $position, $target, $up, $fovy, $projection }';
  }
}

enum CameraProjection { perspective, orthographic }
