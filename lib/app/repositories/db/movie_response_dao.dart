import 'package:floor/floor.dart';
import 'package:flutter_20mob_project_final/app/models/movie_response.dart';

@dao
abstract class MovieResponseDao {
  @Query('SELECT * FROM MovieResponse WHERE page = :page')
  Future<MovieResponse> findAll(int page);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertMovieResponse(MovieResponse response);
}