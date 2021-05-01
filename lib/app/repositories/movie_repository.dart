import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/repositories/movie_api_provider.dart';
import 'package:sqflite/sqflite.dart';

class MovieRepository {
  MovieApiProvider _apiProvider = MovieApiProvider();
  Database _database;

  Future<List<MovieModel>> getMovies() {
    return _apiProvider.getMovies();
  }

  Future<List<MovieModel>> getMoviesLocal() {
    if (_database != null) {

    }
  }
}
