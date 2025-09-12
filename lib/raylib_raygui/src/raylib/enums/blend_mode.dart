import '../../generated_bindings.dart' as raylib;

int blendModeToNative(BlendMode mode) => switch (mode) {
  BlendMode.alpha => raylib.BlendMode.BLEND_ALPHA.value,
  BlendMode.additive => raylib.BlendMode.BLEND_ADDITIVE.value,
  BlendMode.multiplied => raylib.BlendMode.BLEND_MULTIPLIED.value,
  BlendMode.addColors => raylib.BlendMode.BLEND_ADD_COLORS.value,
  BlendMode.subtractColors => raylib.BlendMode.BLEND_SUBTRACT_COLORS.value,
  BlendMode.alphaPremultiply => raylib.BlendMode.BLEND_ALPHA_PREMULTIPLY.value,
  BlendMode.custom => raylib.BlendMode.BLEND_CUSTOM.value,
  BlendMode.customSeparate => raylib.BlendMode.BLEND_CUSTOM_SEPARATE.value,
};

enum BlendMode {
  alpha,
  additive,
  multiplied,
  addColors,
  subtractColors,
  alphaPremultiply,
  custom,
  customSeparate,
}
