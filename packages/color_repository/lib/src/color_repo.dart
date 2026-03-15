import 'package:color_repository/src/models/models.dart';

/// Repository interface for colors.
abstract class ColorRepo {
  /// Returns a random RGB color.
  RgbColor getRandomColor();

  /// Returns the  overlay color (black or white)
  /// https://stackoverflow.com/questions/9780632/how-do-i-determine-if-a-color-is-closer-to-white-or-black
  static bool isColorDarkOverlay(RgbColor color) {
    const double redWeight = 0.2126;
    const double greenWeight = 0.7152;
    const double blueWeight = 0.0722;
    const double brightnessThreshold = 128;

    final double perceivedBrightness =
        redWeight * color.red +
        greenWeight * color.green +
        blueWeight * color.blue;

    return perceivedBrightness > brightnessThreshold;
  }
}
