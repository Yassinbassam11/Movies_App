import 'package:flutter/material.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/screens/movie_details_screen.dart';
import 'package:movies_app/widgets/category_capsule.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({super.key, required this.movie});
  final MovieModel movie;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MovieDetailsScreen(movie: widget.movie);
            },
          ),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 90,
                  height: 140,
                  child: Hero(
                    tag: widget.movie.id.toString(),
                    child: Image.network(
                      "http://image.tmdb.org/t/p/w500${widget.movie.backdropPath ?? "Placeholder"}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movie.originalTitle ?? "Unknown Title",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star, color: Colors.yellow[600]),
                        SizedBox(width: 4.0),
                        Text(
                          '${widget.movie.voteAverage}/10',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 6.0,
                      // children: [
                      //   CategoryCapsule(label: "Action"),
                      //   CategoryCapsule(label: "Drama"),
                      //   CategoryCapsule(label: "Thriller"),
                      // ],
                      children: [
                        CategoryCapsule(label: "Action"),
                        CategoryCapsule(label: "Drama"),
                        CategoryCapsule(label: "Thriller"),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.teal),
                        SizedBox(width: 4.0),
                        Text(
                          widget.movie.releaseDate ?? "Unknown Release Date",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            widget.movie.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          color: widget.movie.isFavorite
                              ? Colors.red
                              : Colors.white,
                          onPressed: () {
                            setState(() {
                              if (widget.movie.isFavorite) {
                                // Handle unfavorite action
                                widget.movie.isFavorite = false;
                                appBrain.favouriteMovies.value.remove(
                                  widget.movie,
                                );
                              } else {
                                // Handle favorite action
                                widget.movie.isFavorite = true;
                                appBrain.favouriteMovies.value.add(
                                  widget.movie,
                                );
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
