import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/bloc/movie_bloc.dart';
import 'package:flutter_20mob_project_final/app/bloc/movie_controller.dart';
import 'package:flutter_20mob_project_final/app/models/movie_model.dart';
import 'package:flutter_20mob_project_final/app/views/home_details.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuildPopularListTile extends StatefulWidget {
  final MovieModel movie;

  final MovieBloc bloc;

  final MovieModel favoriteMovie;

  BuildPopularListTile({
    @required this.movie,
    @required this.bloc,
    @required this.favoriteMovie,
  });
  @override
  _BuildPopularListTile createState() => _BuildPopularListTile();
}

class _BuildPopularListTile extends State<BuildPopularListTile> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseUser _currentUser;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  Future<FirebaseUser> _getUser() async {
    if (_currentUser != null) return _currentUser;

    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final AuthResult authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final FirebaseUser user = authResult.user;
      return user;
    } catch (error) {
      return null;
    }
  }

  void _favorite() async {
    MovieController.instance.changeMovies(widget.movie);
    Map<String, dynamic> data = {
      "backdrop_path": widget.movie.backdropPath,
      "favorite": !(widget.movie.favorite == 1),
      "originalTitle": widget.movie.originalTitle,
      "overview": widget.movie.overview,
      "popularity": widget.movie.popularity,
      "posterPath": widget.movie.posterPath,
      "title": widget.movie.title,
      "voteAverage": widget.movie.voteAverage,
    };
    Firestore.instance.collection('bookmark').document(widget.movie.id.toString()).setData(data, merge: true);
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
                  tag: 'poster_${widget.movie.posterPath}',
                  child: _buildPoster(widget.movie.posterPath)),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => {_favorite()},
                  child: _buildIcon(widget.movie.favorite == 1),
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
          snapToEnd: widget.favoriteMovie == null ? true : false,
          color: Colors.white,
          animation: isFavorite ? 'Favorite' : 'Unfavorite',
        ),
      ),
    );
  }
}
