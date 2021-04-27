import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/views/home_view.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/home': (context) => HomeView(),
      },
    );
  }
}
