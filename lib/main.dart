import 'package:flutter/material.dart';
import 'package:movies_app/screens/movies_screen.dart';
import 'package:movies_app/view_model/app_brain.dart';

final appBrain = AppBrain();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: appBrain.isDarkMode,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          theme: isDarkMode
              ? ThemeData.dark().copyWith(
                  appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900]),
                )
              : ThemeData.light().copyWith(
                  appBarTheme: AppBarTheme(backgroundColor: Colors.grey[300]),
                ),
          debugShowCheckedModeBanner: false,
          home: MoviesScreen(),
        );
      },
    );
  }
}
