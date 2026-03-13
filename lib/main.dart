import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

/// Root application widget.
class Main extends StatelessWidget {
  /// Creates the root application widget.
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

/// Home page widget.
class MyHomePage extends StatefulWidget {
  /// Creates the home page widget.
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const int _kInitialChannel = 255;

  final AppColorRepo _colorRepository = AppColorRepo();
  RgbColor _currentColor = RgbColor(
    red: _kInitialChannel,
    green: _kInitialChannel,
    blue: _kInitialChannel,
  );

  void _handleColorChange() {
    setState(() {
      _currentColor = _colorRepository.getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
        _currentColor.alpha,
        _currentColor.red,
        _currentColor.green,
        _currentColor.blue,
      ),
      body: const Center(
        child: Text('Hello there'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleColorChange,
        tooltip: 'Change Color',
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}
