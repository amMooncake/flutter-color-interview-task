import 'package:color_repository/src/models/models.dart';

/// Returns whether black should be used as overlay color for [color].
/// https://stackoverflow.com/questions/9780632/how-do-i-determine-if-a-color-is-closer-to-white-or-black
bool isColorDarkOverlay(RgbColor color) {
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
