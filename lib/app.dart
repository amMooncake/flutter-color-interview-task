import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_interview_task/screens/home_screen.dart';

/// Root application widget.
class App extends StatelessWidget {
  /// Creates the root application widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Color Interview Task',
      home: HomeScreen(colorRepo: AppColorRepo()),
    );
  }
}
