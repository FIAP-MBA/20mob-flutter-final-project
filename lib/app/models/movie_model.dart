import 'package:floor/floor.dart';

@entity
class MovieModel {
  final String backdropPath;
  int favorite;
  final String homepage;
  @primaryKey
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final int uid;
  final String voteAverage;
  final int voteCount;
  final String year;
  int idResponse;

  MovieModel({
      this.backdropPath,
      this.favorite,
      this.homepage,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.uid,
      this.voteAverage,
      this.voteCount,
      this.year,
      this.idResponse
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : backdropPath = json["backdrop_path"],
        favorite = 0,
        homepage = json["homepage"],
        id = json["id"],
        originalLanguage = json["original_language"],
        originalTitle = json["original_title"],
        overview = json["overview"],
        popularity = json["popularity"].toStringAsFixed(2),
        posterPath = json["poster_path"],
        releaseDate = json["release_date"],
        title = json["title"],
        uid = json["id"],
        voteAverage = json["vote_average"].toString(),
        voteCount = json["vote_count"],
        year = json["year"];

  MovieModel.fromMap(Map<String, dynamic> map, {this.homepage, this.originalLanguage, this.releaseDate, this.uid, this.voteCount, this.year})
      : backdropPath = map["backdropPath"],
        originalTitle = map["originalTitle"],
        overview = map["overview"],
        popularity = map["popularity"],
        posterPath = map["posterPath"],
        title = map["title"],
        id = map["id"],
        voteAverage = map["voteAverage"].toString();

  Map<String, dynamic> toJson() {
    return {
      'backdropPath' : backdropPath,
      'favorite' : favorite,
      'homepage' : homepage,
      'id' : id,
      'originalLanguage' : originalLanguage,
      'originalTitle' : originalTitle,
      'overview' : overview,
      'popularity' : popularity,
      'posterPath' : posterPath,
      'releaseDate' : releaseDate,
      'title' : title,
      'uid' : uid,
      'voteAverage' : voteAverage,
      'voteCount' : voteCount,
      'year' : year,
      'idResponse' : idResponse
    };
  }
}
