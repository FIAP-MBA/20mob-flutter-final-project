import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/models/movie_response.dart';
import 'package:flutter_20mob_project_final/app/repositories/db/app_database.dart';
import 'package:flutter_20mob_project_final/app/repositories/db/movie_model_dao.dart';
import 'package:flutter_20mob_project_final/app/repositories/movie_api_provider.dart';

class MovieRepository {
  MovieApiProvider _apiProvider = MovieApiProvider();
  final AppDatabase _database;
  MovieModelDao _movieModelDao;

  MovieRepository(this._database) {
    _movieModelDao = _database.movieModelDao;
  }

  Future<MovieResponse> getMovies() {
    return _apiProvider.getMovies();
  }

  Future<QuerySnapshot> getBookmarks() {
    return Firestore.instance.collection("bookmark").getDocuments();
  }

  Future<int> insertMovie(MovieModel movie) {
    if (_database != null && _movieModelDao != null) {
      _movieModelDao.insertMovie(movie);
    }
    return null;
  }

  Future<List<MovieModel>> getMovieLocalWith(int page) {
    if (_database != null && _movieModelDao != null) {
      return _movieModelDao.findAll(page);
    }
    return null;
  }
}
