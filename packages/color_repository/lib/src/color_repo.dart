import 'dart:math';

import 'package:color_repository/src/models/models.dart';

/// Repository interface for colors.
abstract class ColorRepo {
  /// Returns a random RGB color.
  RgbColor getRandomColor();

  /// Returns the  overlay color (black or white)
  static bool isColorDarkOverlay(RgbColor color) {
    // it looks scary, but it's just to avoid hard coded numbers.
    const double maxChannelValue = 255.0;
    const double linearizationThreshold = 0.03928;
    const double linearizationDivisor = 12.92;
    const double linearizationOffset = 0.055;
    const double linearizationDivisor2 = 1.055;
    const double linearizationExponent = 2.4;
    const double redLuminance = 0.2126;
    const double greenLuminance = 0.7152;
    const double blueLuminance = 0.0722;
    const double luminanceThreshold = 0.179;

    double linearize(int value) {
      final double v = value / maxChannelValue;

      return v <= linearizationThreshold
          ? v / linearizationDivisor
          : pow(
              (v + linearizationOffset) / linearizationDivisor2,
              linearizationExponent,
            ).toDouble();
    }

    final double rL = redLuminance * linearize(color.red);
    final double gL = greenLuminance * linearize(color.green);
    final double bL = blueLuminance * linearize(color.blue);
    final double luminance = rL + gL + bL;

    return luminance > luminanceThreshold;
  }
}
