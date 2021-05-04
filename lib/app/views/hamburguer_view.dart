import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_20mob_project_final/app/bloc/app_controller.dart';
import 'package:flutter_20mob_project_final/app/views/bookmark_view.dart';
import 'package:flutter_20mob_project_final/app/views/home_view.dart';
import 'package:flutter_20mob_project_final/app/views/profile_view.dart';
import 'package:flutter_20mob_project_final/app/widget/header_view.dart';

class HamburguerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              HeaderView(
                image: AppController.instance.profile != null ? AppController.instance.profile.positionImage : 50,
                name: AppController.instance.profile != null ? AppController.instance.profile.name : "Crie seu perfil",
                email: AppController.instance.profile != null ? AppController.instance.profile.email : "",
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Início"),
                subtitle: Text("tela de início"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person_rounded),
                title: Text("Perfil"),
                subtitle: Text("Criar/Editar perfil"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileView())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("Seus filmes favoritos"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BookmarkView())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Sair"),
                subtitle: Text("Sair do app"),
                onTap: () {
                  SystemNavigator.pop(animated: true);
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