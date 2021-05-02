import 'package:floor/floor.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';

@dao
abstract class MovieModelDao {
  @Query("SELECT * FROM MovieModel WHERE idResponse = :idResponse")
  Future<List<MovieModel>> findAll(int idResponse);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertMovie(MovieModel movie);
}