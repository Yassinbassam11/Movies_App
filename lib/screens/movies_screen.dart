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
  final ScrollController _scrollController = ScrollController();
  void loadMovies() async {
    await ApiServices.sendRequest(appBrain.currentPage);
    setState(() {});
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        appBrain.currentPage++;
        ApiServices.sendRequest(appBrain.currentPage);
      }
    });
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouriteScreen()),
              );
            },
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.error,
            ),
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
                      controller: _scrollController,
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return ValueListenableBuilder(
                          valueListenable: appBrain.favouriteMovies,
                          builder: (context, value, child) {
                            return MovieCard(
                              movie: appBrain.movies.value[index],
                              isFavorite: appBrain.favouriteMovies.value
                                  .contains(appBrain.movies.value[index]),
                            );
                          },
                        );
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
