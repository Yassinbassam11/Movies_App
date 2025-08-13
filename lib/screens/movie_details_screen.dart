import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/widgets/category_capsule.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: movie.id.toString(),
              child: Image.network(
                "http://image.tmdb.org/t/p/w500${movie.posterPath ?? "Placeholder"}",
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 270.0,
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40.0),
                  ),
                  color: Colors.black87,
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.originalTitle ?? "Unknown Title",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[600]),
                        SizedBox(width: 4.0),
                        Text(
                          '${movie.voteAverage}/10',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Spacer(),
                        Text(
                          movie.releaseDate ?? "Unknown Release Date",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 6.0,
                      children: [
                        CategoryCapsule(label: "Action"),
                        CategoryCapsule(label: "Drama"),
                        CategoryCapsule(label: "Thriller"),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      movie.overview ?? "No Overview Available",
                      style: TextStyle(color: Colors.grey[600]),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
