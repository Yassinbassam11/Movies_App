import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/main.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/api_constants.dart';

class ApiServices {
  static Future<void> sendRequest() async {
    // Implementation for sending API requests
    final url = Uri.parse(ApiConstants.popularMoviesUrl);
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
      appBrain.movies.value = moviesModel;
    } else {
      // Handle error response
    }
  }
}
