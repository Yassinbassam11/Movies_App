import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/main.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/api_constants.dart';

class ApiServices {
  static Future<void> sendRequest(int? page) async {
    // Implementation for sending API requests
    final url = Uri.parse("${ApiConstants.popularMoviesUrl}${page ?? 1}");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${ApiConstants.apiKey}'},
    );
    if (response.statusCode == 200) {
      // Handle successful response
      final moviesMap = jsonDecode(response.body) as Map<String, dynamic>;
      final moviesList = moviesMap['results'] as List<dynamic>;
      final List<MovieModel> moviesModel = moviesList
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      appBrain.movies.value = [...appBrain.movies.value, ...moviesModel];
    } else {
      // Handle error response
    }
  }

  static Future<void> fetchMovieGenres() async {
    // Implementation for fetching movie genres
    final String stringUrl =
        "https://api.themoviedb.org/3/genre/movie/list?language=en";
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${ApiConstants.apiKey}',
    };
    final url = Uri.parse(stringUrl);
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Handle successful response
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final genresJson = data['genres'] as List<dynamic>;
      Map<int, String> genres = {};
      for (var genre in genresJson) {
        genres[genre['id']] = genre['name'];
      }
      appBrain.movieGenres = genres;
    } else {
      // Handle error response
    }
  }
}
