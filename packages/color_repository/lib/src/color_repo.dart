import 'package:color_repository/src/models/models.dart';

/// Repository interface for colors.
abstract class ColorRepository {
  /// Returns a random RGB color.
  RgbColor getRandomColor();
}
