import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as appbrain;
import 'package:movies_app/main.dart';
import 'package:movies_app/widgets/movie_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Favourite Movies'),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.dark_mode, color: Colors.white),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Center(
          // child: Text(
          //   'No favourite movies yet!',
          //   style: TextStyle(fontSize: 20, color: Colors.white),
          // ),
          child: ValueListenableBuilder(
            valueListenable: appBrain.favouriteMovies,
            builder: (context, favouriteMovies, child) {
              if (favouriteMovies.isEmpty) {
                return Center(
                  child: Text(
                    'No favourite movies yet!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                );
              }
              return ListView.builder(
                itemCount: favouriteMovies.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: favouriteMovies[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
