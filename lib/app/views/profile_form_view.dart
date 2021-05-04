import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/bloc/app_controller.dart';
import 'package:flutter_20mob_project_final/app/bloc/profile_bloc.dart';
import 'package:flutter_20mob_project_final/app/widget/header_view.dart';

class ProfileFormView extends StatefulWidget {
  @override
  _ProfileFormViewState createState() => _ProfileFormViewState();
}

class _ProfileFormViewState extends State<ProfileFormView> {
  int image = AppController.instance.profile != null ? AppController.instance.profile.positionImage : 1;
  String name = AppController.instance.profile != null ? AppController.instance.profile.name : "";
  String email = AppController.instance.profile != null ? AppController.instance.profile.email : "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildForm(),
      ),
    );
  }

  _changeImage() {
    if (image + 1 > 3) {
      image = 1;
    } else {
      image += 1;
    }
    print(image);
    setState(() {});
  }

  Widget _buildForm() {
    return Column(
      children: [
        HeaderView(image: image, name: name, email: email, onTap: () { _changeImage(); }),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Nome',
            ),
            onChanged: (text) {
              name = text;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Email',
            ),
            onChanged: (text) {
              email = text;
            },
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ElevatedButton(
              child: Text('Salvar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
              onPressed: () {
                profileBloc.insertLocalProfile(name, email, image);
                setState(() {});
                Navigator.pop(context);
              },
            )),
      ],
    );
  }
}
