import 'package:flutter/foundation.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBrain {
  ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);
  ValueNotifier<List<MovieModel>> favouriteMovies = ValueNotifier([]);
  ValueNotifier<bool> isDarkMode = ValueNotifier(true);
  Map<int, String> movieGenres = {};
  int currentPage = 1;

  Future<void> initialize() async {
    // Load initial data or preferences if needed
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? true;
  }
}
