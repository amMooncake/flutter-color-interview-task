// Rectutment task say to no use external libraries,
// but math is core, build in library, so I think it's fine.
import 'dart:math';
import 'package:color_repository/src/color_repo.dart';
import 'package:color_repository/src/models/models.dart';

/// [ColorRepo] implementation that generates random colors.
class AppColorRepo implements ColorRepo {
  final Random _random = Random();

  @override
  RgbColor getRandomColor() {
    final int r = _random.nextInt(256);
    final int g = _random.nextInt(256);
    final int b = _random.nextInt(256);

    return RgbColor(red: r, green: g, blue: b);
  }
}
