import 'dart:async';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/repositories/db/movie_model_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [MovieModel])
abstract class AppDatabase extends FloorDatabase {
  MovieModelDao get movieModelDao;
}