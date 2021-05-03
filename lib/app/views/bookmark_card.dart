import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/bloc/movie_bloc.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/views/home_details.dart';

class BuildBookmarkListTile extends StatefulWidget {

  final MovieModel movie;

  final MovieBloc bloc;

  BuildBookmarkListTile({
    @required this.movie,
    @required this.bloc
  });

  @override
  _BuildBookmarkListTile createState() => _BuildBookmarkListTile();
}

class _BuildBookmarkListTile extends State<BuildBookmarkListTile> {

  @override
  void initState() {
    super.initState();
  }

  void _favorite() async {
    // MovieController.instance.changeMovies(widget.movie);
    // Firestore.instance.collection('bookmark').document(widget.movie.id.toString()).setData(data, merge: true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return MovieDetails(
              movie: widget.movie,
            );
          },
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Hero(
                  tag: 'poster_bookmark_${widget.movie.posterPath}',
                  child: _buildPoster(widget.movie.posterPath)),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => {_favorite()},
                  child: _buildIcon(true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPoster(String posterPath) {
    if (posterPath == null) {
      return Image.asset('images/placeholder.png');
    } else {
      return CachedNetworkImage(
        imageUrl: "http://image.tmdb.org/t/p/" + "w185" + widget.movie.posterPath,
        placeholder: (context, url) => Image.asset('images/placeholder.png', fit: BoxFit.cover),
        fit: BoxFit.cover
      );
    }
  }

  Widget _buildIcon(bool isFavorite) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 10.0),
      child: Container(
        width: 23.0,
        height: 23.0,
        child: FlareActor(
          'assets/Favorite.flr',
          shouldClip: false,
          snapToEnd: true,
          color: Colors.white,
          animation: isFavorite ? 'Favorite' : 'Unfavorite',
        ),
      ),
    );
  }
}
