import 'package:color_repository/color_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_interview_task/screens/home_screen.dart';

import 'package:provider/provider.dart';

/// Root application widget.
class App extends StatelessWidget {
  /// provides the necessary repositories to the widget tree.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ColorRepo>(
          create: (_) => AppColorRepo(),
        ),
        ChangeNotifierProvider<FavoritesRepo>(
          create: (_) => AppFavoritesRepo(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: '.SF Pro Text',
        ),
        title: 'Flutter Color Interview Task',
        home: const HomeScreen(),
      ),
    );
  }
}
