import 'package:floor/floor.dart';
import 'movie_model.dart';

@entity
class MovieResponse {
  @PrimaryKey(autoGenerate: true)
  int id;
  final int page;
  @ignore
  final List<MovieModel> results;
  final int totalResults;
  final int totalPages;
  final String error;

  MovieResponse({this.id, this.page, this.results, this.totalResults, this.totalPages, this.error});

  MovieResponse.fromJson(Map<String, dynamic> json)
      : page = json["page"],
        results = (json["results"] as List)
            .map((i) => new MovieModel.fromJson(i))
            .toList(),
        totalResults = json["total_results"],
        totalPages = json["total_pages"],
        error = "";

  MovieResponse.withError(String errorValue)
      : page = 0,
        results = [],
        totalPages = 0,
        totalResults = 0,
        error = errorValue;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'page': page,
      'results': results.map((e) => e.toJson()).toList(growable: false),
      'totalResults': totalResults,
      'totalPages': totalPages,
      'error': error
    };
  }
}
