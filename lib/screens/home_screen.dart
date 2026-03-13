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

  RgbColor _currentRgbColor = RgbColor(
    red: _fullOpacity,
    green: _fullOpacity,
    blue: _fullOpacity,
  );
  Color _currentColor = Colors.white;
  void handleColorChange() {
    final RgbColor rgbColor = widget._repository.getRandomColor();
    setState(() {
      _currentRgbColor = rgbColor;
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
          color: Colors.black54,
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
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: spacing),
                      RichText(
                        text: TextSpan(
                          text: 'RGB: ',
                          style: baseBodyStyle.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  '(${_currentRgbColor.red}, '
                                  '${_currentRgbColor.green}, '
                                  '${_currentRgbColor.blue})',
                              style: baseBodyStyle.copyWith(
                                color: Colors.black54,
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
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
