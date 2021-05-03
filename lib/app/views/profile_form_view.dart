import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/bloc/profile_bloc.dart';
import 'package:flutter_20mob_project_final/app/bloc/profile_controller.dart';
import 'package:flutter_20mob_project_final/app/repositories/db/app_database.dart';
import 'package:flutter_20mob_project_final/app/repositories/profile_repository.dart';

class ProfileFormView extends StatefulWidget {
  @override
  _ProfileFormViewState createState() => _ProfileFormViewState();
}

class _ProfileFormViewState extends State<ProfileFormView> {
  @override
  void initState() {
    super.initState();
    _createDataBase();
  }

  _createDataBase() {
    $FloorAppDatabase.databaseBuilder('app_database.db').build().then((value) {
      AppDatabase _database = value;
      profileBloc.repository = ProfileRepository(_database);
      profileBloc.getLocalProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                  "https://media-exp1.licdn.com/dms/image/C4D03AQHhzonVPmrkow/profile-displayphoto-shrink_800_800/0/1612361529978?e=1625097600&v=beta&t=mjnF-EARrM-7HJo4YG_HOf7vphgiDhYRSThJhU1JS0U"),
            ),
            accountName: Text(ProfileController.instance.profile != null
                ? ProfileController.instance.profile.name
                : ""),
            accountEmail: Text(ProfileController.instance.profile != null
                ? ProfileController.instance.profile.email
                : "")),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Nome',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Email',
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ElevatedButton(
              child: Text('Salvar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
              onPressed: () {},
            )),
      ],
    );
  }
}
