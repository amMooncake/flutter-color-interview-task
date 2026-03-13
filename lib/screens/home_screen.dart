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
  void handleColorChange() {
    setState(() {
      final RgbColor rgbColor = widget._repository.getRandomColor();
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
    return Scaffold(
      backgroundColor: _currentColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: handleColorChange,
        child: const SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text('Hello there'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
