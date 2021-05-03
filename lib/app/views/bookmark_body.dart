import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookmarkBody extends StatefulWidget {

  @override
  _BookmarkBodyViewState createState() => _BookmarkBodyViewState();
}

class _BookmarkBodyViewState extends State<BookmarkBody> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildBody(),
      ),
    );
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
}