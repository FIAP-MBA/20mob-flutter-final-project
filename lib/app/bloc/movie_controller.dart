import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';

class MovieController extends ChangeNotifier {
  static MovieController instance = MovieController();

  List<MovieModel> movies;
  MovieModel movie;

  changeMovies(MovieModel movie) {
    movies.forEach((element) {
      if (element.id == movie.id) {
        element.favorite = 1;
        changeMovie(element);
      }
    });
    notifyListeners();
  }

  changeMovie(MovieModel movie) {
    this.movie = movie;
    notifyListeners();
  }

  changeMoviesApi(List<MovieModel> movies) {
    this.movies = movies;
    notifyListeners();
  }
}
