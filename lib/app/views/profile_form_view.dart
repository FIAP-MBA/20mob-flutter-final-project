import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/bloc/profile_bloc.dart';
import 'package:flutter_20mob_project_final/app/bloc/profile_controller.dart';

class ProfileFormView extends StatefulWidget {
  @override
  _ProfileFormViewState createState() => _ProfileFormViewState();
}

class _ProfileFormViewState extends State<ProfileFormView> {
  int image = ProfileController.instance.profile != null ? ProfileController.instance.profile.positionImage : 1;
  String name = ProfileController.instance.profile != null ? ProfileController.instance.profile.name : "";
  String email = ProfileController.instance.profile != null ? ProfileController.instance.profile.email : "";

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
  }

  Widget _buildForm() {
    return Column(
      children: [
        UserAccountsDrawerHeader(
            currentAccountPicture: InkWell(
                onTap: () {
                  _changeImage();
                  setState(() {});
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset("images/$image.jpg")
                )
            ),
              accountName: Text(name),
            accountEmail: Text(email),
        ),
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
              },
            )),
      ],
    );
  }
}
