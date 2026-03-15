import 'package:color_repository/src/models/models.dart';

/// Repository interface for managing favorite colors.
abstract class FavoritesRepo {
  /// Returns all favorite colors.
  List<RgbColor> getFavorites();

  /// Returns true when [color] is marked as favorite.
  bool isFavorite(RgbColor color);

  /// Adds [color] to favorites if not present.
  void addFavorite(RgbColor color);

  /// Removes [color] from favorites when present.
  void removeFavorite(RgbColor color);

  /// Toggles favorite state for [color].
  void toggleFavorite(RgbColor color);
}
