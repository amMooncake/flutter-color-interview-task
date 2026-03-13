import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';

/// Home screen widget.
class HomeScreen extends StatefulWidget {
  /// Creates the home screen widget.
  const HomeScreen({
    required ColorRepo colorRepo,
    super.key,
  }) : _repository = colorRepo;

  final ColorRepo _repository;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _fullOpacity = 255;
  Color _currentColor = Colors.white;
  bool isDarkOverlay = true;

  void handleColorChange() {
    final RgbColor rgbColor = widget._repository.getRandomColor();
    setState(() {
      isDarkOverlay = ColorRepo.isColorDarkOverlay(rgbColor);

      _currentColor = Color.fromARGB(
        _fullOpacity,
        rgbColor.red,
        rgbColor.green,
        rgbColor.blue,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

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
      backgroundColor: _currentColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: handleColorChange,
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
                      RichText(
                        text: TextSpan(
                          text: 'RGB: ',
                          style: baseBodyStyle.copyWith(
                            // dart format off
                            color: isDarkOverlay ? 
                                Colors.black54 : 
                                Colors.white,
                            // dart format on
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  '(${(_currentColor.r * 255).round()}, '
                                  '${(_currentColor.g * 255).round()}, '
                                  '${(_currentColor.b * 255).round()})',
                              style: baseBodyStyle.copyWith(
                                // dart format off
                                color: isDarkOverlay ? 
                                  Colors.black54 : 
                                  Colors.white,
                                // dart format on
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Tap anywhere to change the color",
                style: baseBodyStyle.copyWith(
                  color: isDarkOverlay ? Colors.black54 : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
