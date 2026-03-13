// Normally, I don't leave those type of comments,
// but I think it's fine in recrutment task.
//
// Rectutment task say to no use external libraries,
// but math is core, build in library, so I think it's fine.
import 'dart:math';

import 'package:color_repository/src/color_repo.dart';
import 'package:color_repository/src/models/models.dart';

/// [ColorRepository] implementation that generates random colors.
class AppColorRepository implements ColorRepository {
  @override
  RgbColor getRandomColor() {
    final random = Random();
    final int r = random.nextInt(256);
    final int g = random.nextInt(256);
    final int b = random.nextInt(256);
    return RgbColor(red: r, green: g, blue: b);
  }
}
