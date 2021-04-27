import 'movie_model.dart';

class MovieResponse {
  final List<MovieModel> results;
  final String error;

  MovieResponse(this.results, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : results = (json["results"] as List)
            .map((i) => new MovieModel.fromJson(i))
            .toList(),
        error = "";

  MovieResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
