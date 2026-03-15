import 'package:flutter/material.dart';

/// Represents an RGB color value.
class RgbColorEntity {
  /// Alpha channel,
  final int alpha = 255;

  /// Red channel
  final int red;

  /// Green channel
  final int green;

  /// Blue channel
  final int blue;

  /// Creates an RgbColorEntity with the provided red, green and blue values
  RgbColorEntity({
    required this.red,
    required this.green,
    required this.blue,
  });

  /// Creates an RgbColorEntity from a Flutter Color object
  factory RgbColorEntity.fromFlutterColor(Color color) {
    const int maxChannelValue = 255;

    return RgbColorEntity(
      red: (color.r * maxChannelValue).round().clamp(0, maxChannelValue),
      green: (color.g * maxChannelValue).round().clamp(0, maxChannelValue),
      blue: (color.b * maxChannelValue).round().clamp(0, maxChannelValue),
    );
  }

  /// Converts the RgbColorEntity to a new RgbColorEntity
  RgbColorEntity toEntity() {
    return RgbColorEntity(
      red: red,
      green: green,
      blue: blue,
    );
  }

  /// Converts the RgbColorEntity to a Flutter Color object
  Color toFlutterColor() {
    return Color.fromARGB(alpha, red, green, blue);
  }
}
