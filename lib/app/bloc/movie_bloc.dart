import 'package:flutter_20mob_project_final/app/bloc/movie_controller.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<List<MovieModel>> _subject =
      BehaviorSubject<List<MovieModel>>();

  getMovies() async {
    List<MovieModel> response = await _repository.getMovies();
    MovieController.instance.changeMoviesApi(response);
    print(response);
    _subject.sink.add(response);
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
