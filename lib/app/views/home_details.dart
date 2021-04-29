import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/widget/text_movie.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movie;

  MovieDetails({Key key, @required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Image.network(
                    "http://image.tmdb.org/t/p/" + "w500" + movie.backdropPath,
                    fit: BoxFit.cover,
                  ),
                ),
                titlePadding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                centerTitle: true,
                title: MovieDetailsTextWidgets().buildSectionTitle(movie.title),
              ),
            ),
          ];
        },
        body: Stack(
          clipBehavior: Clip.hardEdge,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("http://image.tmdb.org/t/p/" +
                        "w500" +
                        movie.backdropPath),
                    fit: BoxFit.fitHeight),
              ),
              child: new BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: Hero(
                            tag: 'poster_${movie.posterPath}',
                            child: Image.network(
                              "http://image.tmdb.org/t/p/" +
                                  "w500" +
                                  movie.posterPath,
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                      _buildExtraDetails(movie),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MovieDetailsTextWidgets().buildText(movie.overview),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExtraDetails(MovieModel extraDetails) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 8.0,
          runSpacing: 4.0,
          children: <Widget>[
            MovieDetailsTextWidgets()
                .buildText('Titulo: ${extraDetails.title}'),
            MovieDetailsTextWidgets()
                .buildText('Avaliação: ${extraDetails.voteAverage}'),
            MovieDetailsTextWidgets()
                .buildText('Popularidade: ${extraDetails.popularity}'),
          ],
        ));
  }
}
