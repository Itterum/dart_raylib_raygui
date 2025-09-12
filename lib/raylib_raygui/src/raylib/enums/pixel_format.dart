import '../../generated_bindings.dart' as raylib;

enum PixelFormat {
  uncompressedGrayscale,
  uncompressedGrayAlpha,
  uncompressedR5G6B5,
  uncompressedR8G8B8,
  uncompressedR5G5B5A1,
  uncompressedR4G4B4A4,
  uncompressedR8G8B8A8,
  uncompressedR32,
  uncompressedR32G32B32,
  uncompressedR32G32B32A32,
  compressedDXT1rgb,
  compressedDXT1rgba,
  compressedDXT3rgba,
  compressedDXT5rgba,
  compressedETC1rgb,
  compressedETC2rgb,
  compressedETC2eacRGBA,
  compressedPVRTrgb,
  compressedPVRTrgba,
  compressedASTC4x4rgba,
  compressedASTC8x8rgba,
}

const _pixelFormatMap = {
  PixelFormat.uncompressedGrayscale:
      raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_GRAYSCALE,
  PixelFormat.uncompressedGrayAlpha:
      raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA,
  PixelFormat.uncompressedR5G6B5:
      raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_R5G6B5,
  PixelFormat.uncompressedR8G8B8:
      raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8,
  PixelFormat.uncompressedR5G5B5A1:
      raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_R5G5B5A1,
  PixelFormat.uncompressedR4G4B4A4:
      raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_R4G4B4A4,
  PixelFormat.uncompressedR8G8B8A8:
      raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,
  PixelFormat.uncompressedR32: raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32,
  PixelFormat.uncompressedR32G32B32:
      raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32,
  PixelFormat.uncompressedR32G32B32A32:
      raylib.PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32A32,
  PixelFormat.compressedDXT1rgb:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_DXT1_RGB,
  PixelFormat.compressedDXT1rgba:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_DXT1_RGBA,
  PixelFormat.compressedDXT3rgba:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_DXT3_RGBA,
  PixelFormat.compressedDXT5rgba:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_DXT5_RGBA,
  PixelFormat.compressedETC1rgb:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_ETC1_RGB,
  PixelFormat.compressedETC2rgb:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_ETC2_RGB,
  PixelFormat.compressedETC2eacRGBA:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA,
  PixelFormat.compressedPVRTrgb:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_PVRT_RGB,
  PixelFormat.compressedPVRTrgba:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_PVRT_RGBA,
  PixelFormat.compressedASTC4x4rgba:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA,
  PixelFormat.compressedASTC8x8rgba:
      raylib.PixelFormat.PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA,
};

int pixelFormatToNative(PixelFormat format) => _pixelFormatMap[format]!.value;

PixelFormat pixelFormatToDart(int format) {
  final entry = _pixelFormatMap.entries.firstWhere(
    (e) => e.value == format,
    orElse: () => throw Exception('Unknown PixelFormat: $format'),
  );
  return entry.key;
}
