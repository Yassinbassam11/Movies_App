import 'package:flutter/material.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/screens/favourite_screen.dart';
import 'package:movies_app/services/api_services.dart';
import 'package:movies_app/widgets/movie_card.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  void loadMovies() async {
    await ApiServices.sendRequest();
    setState(() {});
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey[900],
        title: const Text('Popular Movies'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouriteScreen()),
              );
            },
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
          IconButton(
            onPressed: () {
              if (appBrain.isDarkMode.value) {
                appBrain.isDarkMode.value = false;
                setState(() {});
              } else {
                appBrain.isDarkMode.value = true;
                setState(() {});
              }
            },
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: appBrain.movies,
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return MovieCard(movie: value[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
