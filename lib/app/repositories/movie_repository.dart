import 'package:flutter_20mob_project_final/app/models/movie_response.dart';
import 'package:flutter_20mob_project_final/app/repositories/movie_api_provider.dart';
import 'package:sqflite/sqflite.dart';

class MovieRepository {
  MovieApiProvider _apiProvider = MovieApiProvider();
  Database _database;

  Future<MovieResponse> getMovies() {
    return _apiProvider.getMovies();
  }

  Future<MovieResponse> getMoviesLocal() {
    if (_database != null) {

    }
  }
}
