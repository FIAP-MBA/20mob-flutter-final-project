import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_20mob_project_final/app/bloc/profile_controller.dart';
import 'package:flutter_20mob_project_final/app/views/bookmark_view.dart';
import 'package:flutter_20mob_project_final/app/views/home_view.dart';
import 'package:flutter_20mob_project_final/app/views/profile_view.dart';

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
                  child: Image.asset("images/${ProfileController.instance.profile != null ? ProfileController.instance.profile.positionImage : 1}.jpg")
                ),
                accountName: Text(ProfileController.instance.profile != null ? ProfileController.instance.profile.name : ""),
                accountEmail: Text(ProfileController.instance.profile != null ? ProfileController.instance.profile.email : ""),
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