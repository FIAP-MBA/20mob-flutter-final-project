import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_20mob_project_final/app/bloc/movie_controller.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/models/movie_response.dart';
import 'package:flutter_20mob_project_final/app/repositories/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  MovieRepository repository;
  final BehaviorSubject<List<MovieModel>> _subject =
      BehaviorSubject<List<MovieModel>>();
  final BehaviorSubject<List<MovieModel>> _bookmark =
      BehaviorSubject<List<MovieModel>>();

  getMovies() async {
    int page = 1; //TODO: get more pages
    try {
      MovieResponse response = await repository.getMovies();
      _handlerList(response);
    } catch (error) {
      print(error);
      _getMoviesLocal(page);
    }
  }

  getBookmarks() async {
    try {
      QuerySnapshot response = await repository.getBookmarks();
      _handlerListFromFirestore(response);
    } catch (error) {
      print(error);
    }
  }

  _getMoviesLocal(int page) async {
    try {
      List<MovieModel> list = await repository.getMovieLocalWith(page);
      list.sort((a, b) => double.parse(b.popularity).compareTo(double.parse(a.popularity)));
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

  _handlerListFromFirestore(QuerySnapshot response) async {
    List<MovieModel> list = new List.empty(growable: true);
    response.documents.forEach((element) async {
      list.add(new MovieModel.fromMap(element.data));
    });
    print(list);
    if(list.isEmpty) {
      _bookmark.sink.add(null);
    } else {
      MovieController.instance.changeMoviesBookmark(list);
      _bookmark.sink.add(list);
    }
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<MovieModel>> get subject => _subject;
  BehaviorSubject<List<MovieModel>> get bookmark => _bookmark;
}

final bloc = MovieBloc();
