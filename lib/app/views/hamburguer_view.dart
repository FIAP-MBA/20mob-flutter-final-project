import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/views/home_view.dart';

class HamburguerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                      "https://media-exp1.licdn.com/dms/image/C4D03AQHhzonVPmrkow/profile-displayphoto-shrink_800_800/0/1612361529978?e=1625097600&v=beta&t=mjnF-EARrM-7HJo4YG_HOf7vphgiDhYRSThJhU1JS0U"),
                ),
                accountName: Text("Rafael"),
                accountEmail: Text("t@t.com"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("inicio"),
                subtitle: Text("tela de inicio"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("sair"),
                subtitle: Text("sair da tela"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Filmes"),
          actions: [],
        ),
        body: HomeView());
  }
}