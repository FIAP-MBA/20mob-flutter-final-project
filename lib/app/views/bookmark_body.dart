import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/bloc/movie_bloc.dart';
import 'package:flutter_20mob_project_final/app/bloc/movie_controller.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/views/bookmark_card.dart';
import 'package:lottie/lottie.dart';

class BookmarkBody extends StatefulWidget {

  @override
  _BookmarkBodyViewState createState() => _BookmarkBodyViewState();
}

class _BookmarkBodyViewState extends State<BookmarkBody> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: MovieController.instance,
      builder: (BuildContext context, Widget child) {
        return StreamBuilder<List<MovieModel>>(
          stream: bloc.bookmark.stream,
          builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (snapshot.hasData) {
              return _buildMovieWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error, context);
            } else {
              return _buildBody();
            }
          },
        );
      },
    );
  }

  Widget _buildMovieWidget(List<MovieModel> bookmarks) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) =>
          _handleScrollNotification(notification, bloc),
      child: GridView.builder(
        itemCount: bookmarks.length,
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, position) {
          if (position >= bookmarks.length) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return BuildBookmarkListTile(
            movie: bookmarks[position],
            bloc: bloc
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget(String error, BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error",
                style: Theme.of(context).textTheme.subtitle),
          ],
        ));
  }

  Widget _buildBody() {
    return Column(
      children: [
        // Load a Lottie file from your assets
        Lottie.asset('assets/empty_state_no_favorites.json'),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Center(
            child: Text("Você ainda não tem filmes favoritos, adicione na Home"),
          )
        )
      ],
    );
  }

  void loadBookmarks() {
    bloc.getBookmarks();
  }

  bool _handleScrollNotification(
      ScrollNotification notification, MovieBloc bloc) {
    return false;
  }
}