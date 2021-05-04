import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/bloc/movie_bloc.dart';
import 'package:flutter_20mob_project_final/app/bloc/app_controller.dart';
import 'package:flutter_20mob_project_final/app/bloc/profile_bloc.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/repositories/db/app_database.dart';
import 'package:flutter_20mob_project_final/app/repositories/movie_repository.dart';
import 'package:flutter_20mob_project_final/app/repositories/profile_repository.dart';
import 'package:flutter_20mob_project_final/app/views/movie_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _createDataBase();
  }

  _createDataBase() {
    $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .build()
        .then((value) {
          AppDatabase _database = value;
          movieBloc.repository = MovieRepository(_database);
          profileBloc.repository = ProfileRepository(_database);
          movieBloc.getMovies();
          profileBloc.getLocalProfile();
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (BuildContext context, Widget child) {
        return StreamBuilder<List<MovieModel>>(
          stream: movieBloc.subject.stream,
          builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (snapshot.hasData) {
              return _buildMovieWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error, context);
            } else {
              return _buildLoadingWidget(context);
            }
          },
        );
      },
    );
  }

  Widget _buildErrorWidget(String error, BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error",
            style: Theme.of(context).textTheme.subtitle2),
      ],
    ));
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading data from API...",
            style: Theme.of(context).textTheme.subtitle2),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        )
      ],
    ));
  }

  Widget _buildMovieWidget(List<MovieModel> movies) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) =>
          _handleScrollNotification(notification, movieBloc),
      child: GridView.builder(
        itemCount: movies.length,
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, position) {
          if (position >= movies.length) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return BuildPopularListTile(
            movie: movies[position],
            bloc: movieBloc,
            favoriteMovie: AppController.instance.movies[position],
          );
        },
      ),
    );
  }

  bool _handleScrollNotification(
      ScrollNotification notification, MovieBloc bloc) {
    return false;
  }
}
