import 'package:flutter_20mob_project_final/app/bloc/movie_controller.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/models/movie_response.dart';
import 'package:flutter_20mob_project_final/app/repositories/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<List<MovieModel>> _subject =
      BehaviorSubject<List<MovieModel>>();

  getMovies() async {
    try {
      MovieResponse response = await _repository.getMovies();
      _handlerList(response);
    } catch (error) {
      print(error);
      _getMoviesLocal();
    }
  }

  _getMoviesLocal() async {
    try {
      MovieResponse response = await _repository.getMovies();
      _handlerList(response);
    } catch(error) {
      print(error);
    }
  }

  upgradeMovies() async {
    MovieResponse response = await _repository.getMovies();
    _handlerList(response);
  }

  _handlerList(MovieResponse response) {
    print(response.toJson());
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
