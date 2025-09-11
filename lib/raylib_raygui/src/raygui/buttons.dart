import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../library.dart';
import '../raylib/classes/rectangle.dart';

int guiButton(Rectangle bounds, String text) {
  return library.GuiButton(bounds.ref, text.toNativeUtf8().cast<Char>());
}
