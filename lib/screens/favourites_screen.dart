import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_interview_task/components/my_rgb_label.dart';
import 'package:provider/provider.dart';

/// Favourites screen widget.
class FavouritesScreen extends StatefulWidget {
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
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    final FavoritesRepo favoritesRepo = context.read<FavoritesRepo>();
    final List<RgbColor> favorites = favoritesRepo
        .getFavorites()
        .reversed
        .toList();
    final Color overlayColor = widget.isDarkOverlay
        ? Colors.black
        : Colors.white;

    final TextTheme textTheme = Theme.of(context).textTheme;

    final String colorsText = favorites.isEmpty
        ? 'No favourite colors yet.'
        : 'Favourite colors:';

    return Scaffold(
      backgroundColor: widget.currentColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Favourites', style: TextStyle(color: overlayColor)),
            iconTheme: IconThemeData(color: overlayColor),
            backgroundColor: widget.currentColor,
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
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
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
                            setState(() {
                              favoritesRepo.removeFavorite(containerRGBcolor);
                            });
                          },
                          icon: const Icon(Icons.delete_outline),
                          color: isDarkContainer ? Colors.black : Colors.white,
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
