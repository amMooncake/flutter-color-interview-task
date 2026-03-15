import 'package:color_repository/src/entities/entities.dart';

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

  /// Creates an RgbColor from a RgbColorEntity
  factory RgbColor.fromEntity(RgbColorEntity entity) {
    return RgbColor(
      red: entity.red,
      green: entity.green,
      blue: entity.blue,
    );
  }

  /// Converts the RgbColor to a new RgbColorEntity
  RgbColorEntity toEntity() {
    return RgbColorEntity(
      red: red,
      green: green,
      blue: blue,
    );
  }
}
