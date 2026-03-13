/// Represents an RGB color value.
class RgbColor {
  /// I will keep it simple and use only RGB.
  final int alpha = 255;
  final int red;
  final int green;
  final int blue;

  RgbColor({
    required this.red,
    required this.green,
    required this.blue,
  });
}
