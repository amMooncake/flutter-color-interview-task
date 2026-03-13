import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_interview_task/components/my_rgb_label.dart';

/// Home screen widget.
class HomeScreen extends StatefulWidget {
  /// Creates the home screen widget.
  const HomeScreen({
    required ColorRepo colorRepo,
    required FavoritesRepo favoritesRepo,
    super.key,
  }) : _repository = colorRepo,
       _favoritesRepo = favoritesRepo;

  final ColorRepo _repository;
  final FavoritesRepo _favoritesRepo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _fullOpacity = 255;
  Color currentColor = Colors.white;
  RgbColor rgbColor = RgbColor(
    red: _fullOpacity,
    green: _fullOpacity,
    blue: _fullOpacity,
  );
  bool isDarkOverlay = true;

  void _getRandomColor() {
    rgbColor = widget._repository.getRandomColor();
    currentColor = Color.fromARGB(
      _fullOpacity,
      rgbColor.red,
      rgbColor.green,
      rgbColor.blue,
    );
    isDarkOverlay = ColorRepo.isColorDarkOverlay(rgbColor);
  }

  @override
  void initState() {
    super.initState();
    _getRandomColor();
  }

  void _handleColorChange() {
    setState(_getRandomColor);
  }

  void _handleToggleFavorite() {
    setState(() {
      widget._favoritesRepo.toggleFavorite(rgbColor);
    });
    print(widget._favoritesRepo.getFavorites());
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    const double iconSize = 30;

    final TextStyle baseBodyStyle =
        textTheme.bodyMedium ??
        const TextStyle(
          fontSize: 14,
        );
    final TextStyle baseHeadlineStyle =
        textTheme.headlineMedium ??
        const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        );

    const double spacing = 10;

    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(
        // title: Text(
        //   'Go to favourites ->',
        //   style: textTheme.headlineSmall?.copyWith(
        //     color: isDarkOverlay ? Colors.black : Colors.white,
        //   ),
        // ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Row(
              children: [
                Icon(Icons.arrow_forward_ios),
                Icon(Icons.favorite_outline),
              ],
            ),
            color: isDarkOverlay ? Colors.black : Colors.white,
          ),
        ],
        backgroundColor: currentColor,
        elevation: 0,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _handleColorChange,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        'Hello there',
                        style: baseHeadlineStyle.copyWith(
                          color: isDarkOverlay ? Colors.black : Colors.white,
                        ),
                      ),
                      const SizedBox(height: spacing),
                      MyRGBLabel(
                        baseBodyStyle: baseBodyStyle,
                        isDarkOverlay: isDarkOverlay,
                        currentColor: currentColor,
                      ),
                      const SizedBox(height: spacing),
                      IconButton(
                        onPressed: _handleToggleFavorite,
                        icon: Icon(
                          // ignore: lines_longer_than_80_chars
                          widget._favoritesRepo.isFavorite(rgbColor) ? Icons.favorite : Icons.favorite_border,
                          color: isDarkOverlay ? Colors.black : Colors.white,
                          size: iconSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Tap anywhere to change the color\nPress the heart icon to add to favorites",
                style: baseBodyStyle.copyWith(
                  color: isDarkOverlay ? Colors.black54 : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
