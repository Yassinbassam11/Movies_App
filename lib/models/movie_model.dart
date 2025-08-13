// class MovieModel2 {
//   final String title;
//   final String imageUrl;
//   final String duration;
//   final List<String> genres;
//   final double rating;

//   MovieModel2({
//     required this.title,
//     required this.imageUrl,
//     required this.duration,
//     required this.genres,
//     required this.rating,
//   });
// }

class MovieModel {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  bool isFavorite;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.isFavorite = false,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
