import 'dart:ffi';

abstract class NativeClass<T extends Struct> {
  late final T ref;

  NativeClass();

  NativeClass.fromRef(this.ref);
}
