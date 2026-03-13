import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_interview_task/components/my_rgb_label.dart';

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
  Color currentColor = Colors.white;
  bool isDarkOverlay = true;

  void _getRandomColor() {
    final RgbColor rgbColor = widget._repository.getRandomColor();
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
      backgroundColor: currentColor,
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
