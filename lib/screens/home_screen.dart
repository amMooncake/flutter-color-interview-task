import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_interview_task/components/my_rgb_label.dart';
import 'package:flutter_color_interview_task/screens/favourites_screen.dart';
import 'package:provider/provider.dart';

/// Home screen widget.
class HomeScreen extends StatefulWidget {
  /// Creates the home screen widget.
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _fullOpacity = 255;

  // it generates random colors
  // ignore: avoid_late_keyword
  late final ColorRepo _colorRepo;

  // it manages the list of favorite colors
  // ignore: avoid_late_keyword
  late final FavoritesRepo _favoritesRepo;

  Color currentColor = Colors.white;
  RgbColor rgbColor = RgbColor(
    red: _fullOpacity,
    green: _fullOpacity,
    blue: _fullOpacity,
  );
  bool isDarkOverlay = true;

  void _getRandomColor() {
    rgbColor = _colorRepo.getRandomColor();
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
    _colorRepo = context.read<ColorRepo>();
    _favoritesRepo = context.read<FavoritesRepo>();
    _getRandomColor();
  }

  void _handleColorChange() {
    setState(_getRandomColor);
  }

  void _handleToggleFavorite() {
    setState(() {
      _favoritesRepo.toggleFavorite(rgbColor);
    });
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => FavouritesScreen(
                    currentColor: currentColor,
                    isDarkOverlay: isDarkOverlay,
                  ),
                ),
              );
            },
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
                        isDarkOverlay: isDarkOverlay,
                        currentColor: currentColor,
                      ),
                      const SizedBox(height: spacing),
                      IconButton(
                        onPressed: _handleToggleFavorite,
                        icon: Icon(
                          _favoritesRepo.isFavorite(rgbColor)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isDarkOverlay ? Colors.black : Colors.white,
                          size: iconSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '''
Tap anywhere to change the color
Press the heart icon to add to favorites''',
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
