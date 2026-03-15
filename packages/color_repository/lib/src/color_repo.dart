import 'package:color_repository/src/models/models.dart';

/// Repository interface for colors.
abstract class ColorRepo {
  /// Returns a random RGB color.
  RgbColor getRandomColor();
}
