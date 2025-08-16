import 'package:flutter/foundation.dart';
import 'package:movies_app/models/movie_model.dart';

class AppBrain {
  ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);
  ValueNotifier<List<MovieModel>> favouriteMovies = ValueNotifier([]);
  ValueNotifier<bool> isDarkMode = ValueNotifier(true);
  int currentPage = 1;
}
