import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/models/profile_model.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  List<MovieModel> movies;
  List<MovieModel> bookmarks;
  MovieModel movie;
  ProfileModel profile;

  changeMovies(MovieModel movie) {
    movies.forEach((element) {
      if (element.id == movie.id) {
        element.favorite = 1;
        changeMovie(element);
      }
    });
    notifyListeners();
  }

  changeProfile(ProfileModel profile) {
    this.profile = profile;
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

  changeMoviesBookmark(List<MovieModel> bookmarks) {
    this.bookmarks = bookmarks;
    notifyListeners();
  }

  deleteMovie(MovieModel movie) {
    bookmarks.remove(movie);
    notifyListeners();
  }
}
