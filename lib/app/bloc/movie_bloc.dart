import 'package:flutter_20mob_project_final/app/bloc/movie_controller.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/repositories/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<List<MovieModel>> _subject =
      BehaviorSubject<List<MovieModel>>();

  getMovies() async {
    try {
      List<MovieModel> response = await _repository.getMovies();
      MovieController.instance.changeMoviesApi(response);
      print(response);
      _subject.sink.add(response);
    } catch (error) {
      print(error);
      _getMoviesLocal();
    }
  }

  _getMoviesLocal() async {
    try {
      List<MovieModel> response = await _repository.getMoviesLocal();
      MovieController.instance.changeMoviesApi(response);
      print(response);
      _subject.sink.add(response);
    } catch(error) {
      print(error);
    }
  }

  upgradeMovies() async {
    List<MovieModel> response = await _repository.getMovies();
    print(response);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<MovieModel>> get subject => _subject;
}

final bloc = MovieBloc();
