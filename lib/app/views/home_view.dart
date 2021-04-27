import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/bloc/movie_bloc.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    bloc.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MovieModel>>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return _buildErrorWidget("Error");
          }
          return _buildMovieWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildMovieWidget(List<MovieModel> data) {
    return Center(
      child: Text(data[0].title),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading data from API...",
            style: Theme.of(context).textTheme.subtitle),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error",
            style: Theme.of(context).textTheme.subtitle),
      ],
    ));
  }
}
