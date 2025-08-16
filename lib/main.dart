import 'package:flutter/material.dart';
import 'package:movies_app/screens/movies_screen.dart';
import 'package:movies_app/view_model/app_brain.dart';

final appBrain = AppBrain();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appBrain.initialize();
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
                  appBarTheme: AppBarTheme(
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Color(0xFF3f3f3f),
                    elevation: 0,
                  ),
                  cardTheme: CardThemeData(color: Color(0xFF2D2D2D)),
                  scaffoldBackgroundColor: Color(
                    0xFF1C1C1E,
                  ), // Lighter background
                  colorScheme: ColorScheme.dark(
                    primary: Colors.amber,
                    secondary: Colors.teal,
                    surface: Color(0xFF2D2D2D),
                    error: Colors.red,
                  ),
                )
              : ThemeData.light().copyWith(
                  appBarTheme: const AppBarTheme(
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Color(0xFF8e8e8e), // Dark grey AppBar
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),
                  cardTheme: CardThemeData(color: Colors.white),
                  scaffoldBackgroundColor: Color(
                    0xFFF8F9FA,
                  ), // Light grey background
                  colorScheme: ColorScheme.light(
                    primary: Colors.blue,
                    secondary: Colors.teal,
                    surface: Colors.white,
                    error: Colors.red,
                  ),
                ),
          debugShowCheckedModeBanner: false,
          home: MoviesScreen(),
        );
      },
    );
  }
}
