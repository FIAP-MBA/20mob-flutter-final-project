import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/views/profile_form_view.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar perfil"),
      ),
      body: ProfileFormView(),
    );
  }
}
