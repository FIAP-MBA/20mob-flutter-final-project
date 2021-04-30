class MovieModel {
  final bool adult;
  final String backdropPath;
  bool favorite;
  final List genreIds;
  final String genres;
  final String homepage;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final int uid;
  final bool video;
  final String voteAverage;
  final int voteCount;
  final String year;

  MovieModel(
      this.adult,
      this.backdropPath,
      this.favorite,
      this.genreIds,
      this.genres,
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
      this.video,
      this.voteAverage,
      this.voteCount,
      this.year);

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json["adult"],
        backdropPath = json["backdrop_path"],
        favorite = false,
        genreIds = json["genre_ids"],
        genres = json["genres"],
        homepage = json["homepage"],
        id = json["id"],
        originalLanguage = json["original_language"],
        originalTitle = json["original_title"],
        overview = json["overview"],
        popularity = json["popularity"].toString(),
        posterPath = json["poster_path"],
        releaseDate = json["release_date"],
        title = json["title"],
        uid = json["id"],
        video = json["video"],
        voteAverage = json["vote_average"].toString(),
        voteCount = json["vote_count"],
        year = json["year"];
}
