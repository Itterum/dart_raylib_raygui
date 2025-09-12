import 'dart:ffi';

class PointerList<V extends NativeType> {
  PointerList(this.pointer);

  final Pointer<V> pointer;
}

extension FloatList on PointerList<Float> {
  double operator [](int index) {
    return pointer.elementAt(index).value;
  }

  void operator []=(int index, double value) {
    pointer.elementAt(index).value = value;
  }
}

extension Uint8List on PointerList<Uint8> {
  int operator [](int index) {
    return pointer.elementAt(index).value;
  }

  void operator []=(int index, int value) {
    pointer.elementAt(index).value = value;
  }
}

extension Uint16List on PointerList<Uint16> {
  int operator [](int index) {
    return pointer.elementAt(index).value;
  }

  void operator []=(int index, int value) {
    pointer.elementAt(index).value = value;
  }
}

extension Uint32List on PointerList<Uint32> {
  int operator [](int index) {
    return pointer.elementAt(index).value;
  }

  void operator []=(int index, int value) {
    pointer.elementAt(index).value = value;
  }
}
