import 'package:flutter_20mob_project_final/app/bloc/movie_controller.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/models/movie_response.dart';
import 'package:flutter_20mob_project_final/app/repositories/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  MovieRepository repository;
  final BehaviorSubject<List<MovieModel>> _subject =
      BehaviorSubject<List<MovieModel>>();

  getMovies() async {
    int page = 1;
    try {
      MovieResponse response = await repository.getMovies();
      _handlerList(response);
    } catch (error) {
      print(error);
      _getMoviesLocal(page);
    }
  }

  _getMoviesLocal(int page) async {
    try {
      List<MovieModel> list = await repository.getMovieLocalWith(page);
      MovieController.instance.changeMoviesApi(list);
      print(list);
      _subject.sink.add(list);
    } catch(error) {
      print(error);
    }
  }

  upgradeMovies() async {
    MovieResponse response = await repository.getMovies();
    _handlerList(response);
  }

  _handlerList(MovieResponse response) async {
    response.results.forEach((element) async {
      element.idResponse = response.page;
      await repository.insertMovie(element);
    });
    List<MovieModel> list = response.results;
    MovieController.instance.changeMoviesApi(list);
    print(list);
    _subject.sink.add(list);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<MovieModel>> get subject => _subject;
}

final bloc = MovieBloc();
