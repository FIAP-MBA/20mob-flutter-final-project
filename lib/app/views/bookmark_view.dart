import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/views/bookmark_body.dart';

class BookmarkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
      ),
      body: BookmarkBody(),
    );
  }
}
