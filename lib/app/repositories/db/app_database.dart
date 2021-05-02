import 'dart:async';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/repositories/db/movie_model_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:flutter_20mob_project_final/app/models/movie_response.dart';
import 'package:flutter_20mob_project_final/app/repositories/db/movie_response_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [MovieResponse, MovieModel])
abstract class AppDatabase extends FloorDatabase {
  MovieResponseDao get movieResponseDao;
  MovieModelDao get movieModelDao;
}