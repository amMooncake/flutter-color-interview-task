import 'package:color_repository/src/favorites_repo.dart';
import 'package:color_repository/src/models/models.dart';

/// [FavoritesRepo] implementation.
class AppFavoritesRepo implements FavoritesRepo {
  final List<RgbColor> _favorites = <RgbColor>[];

  @override
  List<RgbColor> getFavorites() {
    return List<RgbColor>.unmodifiable(_favorites);
  }

  @override
  bool isFavorite(RgbColor color) {
    return _favorites.any((RgbColor item) => _isSameColor(item, color));
  }

  @override
  void addFavorite(RgbColor color) {
    if (isFavorite(color)) {
      return;
    }

    _favorites.add(color);
  }

  @override
  void removeFavorite(RgbColor color) {
    _favorites.removeWhere(
      (RgbColor item) => _isSameColor(item, color),
    );
  }

  @override
  void toggleFavorite(RgbColor color) {
    if (isFavorite(color)) {
      removeFavorite(color);
    } else {
      addFavorite(color);
    }
  }

  bool _isSameColor(RgbColor left, RgbColor right) {
    // dart format off
    return left.red == right.red && 
    left.green == right.green && 
    left.blue == right.blue;
  // dart format on
  }
}
