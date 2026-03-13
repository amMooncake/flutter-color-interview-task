/// Represents an RGB color value.
class RgbColor {
  /// Alpha channel,
  final int alpha = 255;

  /// Red channel
  final int red;

  /// Green channel
  final int green;

  /// Blue channel
  final int blue;

  /// Creates an RgbColor with the provided red, green and blue
  RgbColor({
    required this.red,
    required this.green,
    required this.blue,
  });
}
