import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/repositories/user_api_provider.dart';

class MovieRepository {
  MovieApiProvider _apiProvider = MovieApiProvider();

  Future<List<MovieModel>> getMovies() {
    return _apiProvider.getMovies();
  }
}
