import 'dart:ffi';

import '../../../utils/native_type.dart';
import '../../../utils/pointer_list.dart';
import '../../generated_bindings.dart' as raylib;

class Shader extends NativeClass<raylib.Shader> {
  Shader.fromRef(super.ref) : super.fromRef();

  int get id => ref.id;

  PointerList<Int> get locs => PointerList(ref.locs);
}
