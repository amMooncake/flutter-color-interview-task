import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AppColorRepo _colorRepository = AppColorRepo();
  RgbColor _currentColor = RgbColor(red: 255, green: 255, blue: 255);

  int _counter = 0;

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
