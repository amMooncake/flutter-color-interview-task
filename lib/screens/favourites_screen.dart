import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_interview_task/components/my_rgb_label.dart';
import 'package:provider/provider.dart';

/// Favourites screen widget.
class FavouritesScreen extends StatelessWidget {
  /// Creates the favourites screen widget.
  const FavouritesScreen({
    required this.currentColor,
    required this.isDarkOverlay,
    super.key,
  });

  /// background color
  final Color currentColor;

  /// whether to use dark text on the background color
  final bool isDarkOverlay;

  @override
  Widget build(BuildContext context) {
    final FavoritesRepo favoritesRepo = context.watch<FavoritesRepo>();
    final List<RgbColor> favorites = favoritesRepo
        .getFavorites()
        .reversed
        .toList();
    final Color overlayColor = isDarkOverlay ? Colors.black : Colors.white;

    final TextTheme textTheme = Theme.of(context).textTheme;

    final String colorsText = favorites.isEmpty
        ? 'No favourite colors yet.'
        : 'Favourite colors:';

    return Scaffold(
      backgroundColor: currentColor,
      bottomNavigationBar: FooterCredit(
        overlayColor: overlayColor,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Favourites', style: TextStyle(color: overlayColor)),
            iconTheme: IconThemeData(color: overlayColor),
            backgroundColor: currentColor,
            pinned: favorites.isEmpty,
            floating: true,
          ),
          if (favorites.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  colorsText,
                  style: textTheme.headlineMedium?.copyWith(
                    color: overlayColor,
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ).copyWith(top: 16),
              sliver: SliverList.separated(
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemCount: favorites.length,
                itemBuilder: (_, index) {
                  final RgbColor containerRGBcolor = favorites[index];
                  final bool isDarkContainer = isColorDarkOverlay(
                    containerRGBcolor,
                  );

                  return Container(
                    // this prevents jumping colors from the old widget state
                    key: ValueKey(index),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          blurRadius: 5,
                          color: Colors.black26,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: containerRGBcolor.toEntity().toFlutterColor(),
                    ),
                    height: 50,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyRGBLabel(
                            isDarkOverlay: isDarkContainer,
                            currentColor: containerRGBcolor,
                          ),
                          IconButton(
                            onPressed: () {
                              favoritesRepo.removeFavorite(containerRGBcolor);
                            },
                            icon: const Icon(Icons.delete_outline),
                            color: isDarkContainer
                                ? Colors.black
                                : Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

/// Footer credit widget.
class FooterCredit extends StatelessWidget {
  /// Creates the footer credit widget.
  const FooterCredit({
    required this.overlayColor,
    super.key,
  });

  /// Color for the text
  final Color overlayColor;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'App made by Aleksy Malawski',
              style: textTheme.bodyMedium?.copyWith(color: overlayColor),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'for Solid Software with',
                  style: textTheme.bodyMedium?.copyWith(color: overlayColor),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.favorite,
                  size: 16,
                  color: Colors.redAccent,
                ),
                const SizedBox(width: 6),
                Text(
                  'and',
                  style: textTheme.bodyMedium?.copyWith(color: overlayColor),
                ),
                const SizedBox(width: 6),
                const FlutterLogo(size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
