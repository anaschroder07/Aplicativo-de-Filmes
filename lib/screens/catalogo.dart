import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:trabalho1/screens/assistidos.dart';
import 'dart:convert';

import 'package:trabalho1/screens/avaliar.dart';
import 'package:trabalho1/screens/cadastro.dart';

class Movie {
  final String title;
  final String description;
  final String imageUrl;

  Movie(
      {required this.title, required this.description, required this.imageUrl});
}

class Catalogo extends StatefulWidget {
  @override
  _CatalogoState createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  List<Movie> firstCarouselMovies = [];
  List<Movie> secondCarouselMovies = [];
  List<Movie> thirdCarouselMovies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
    fetchMoreMovies();
  }

  Future<void> fetchMovies() async {
    try {
      final dio = Dio();
      final response = await dio.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=fcf7d49fb3edb91d63b6b3c1033b82c6');

      if (response.statusCode == 200) {
        final data = response.data;
        final results = data['results'];

        final movies = results
            .map<Movie>((movieData) => Movie(
                  title: movieData['title'],
                  description: movieData['overview'],
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movieData['poster_path']}',
                ))
            .toList();

        setState(() {
          firstCarouselMovies = movies.take(10).toList();
          secondCarouselMovies = movies.skip(10).toList();
          isLoading = false;
        });
      } else {
        // Handle error
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  Future<void> fetchMoreMovies() async {
    try {
      final dio = Dio();
      final response = await dio
          .get('https://api.themoviedb.org/3/movie/popular', queryParameters: {
        'api_key': 'fcf7d49fb3edb91d63b6b3c1033b82c6',
        'page': '2',
      });

      if (response.statusCode == 200) {
        final data = response.data;
        final results = data['results'];

        final movies = results
            .map<Movie>((movieData) => Movie(
                  title: movieData['title'],
                  description: movieData['overview'],
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movieData['poster_path']}',
                ))
            .toList();
        setState(() {
          thirdCarouselMovies = movies.take(10).toList();
          isLoading = false;
        });
      } else {
        // Handle error
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: firstCarouselMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = firstCarouselMovies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Avaliar(movie: movie),
                              ),
                            );
                          },
                          child: Image.network(
                            firstCarouselMovies[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: secondCarouselMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = secondCarouselMovies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Avaliar(movie: movie),
                              ),
                            );
                          },
                          child: Image.network(
                            secondCarouselMovies[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: thirdCarouselMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = thirdCarouselMovies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Avaliar(movie: movie),
                              ),
                            );
                          },
                          child: Image.network(
                            thirdCarouselMovies[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
