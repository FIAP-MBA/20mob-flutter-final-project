import 'package:flutter/material.dart';

class ProfileFormView extends StatefulWidget {

  @override
  _ProfileFormViewState createState() => _ProfileFormViewState();
}

class _ProfileFormViewState extends State<ProfileFormView> {

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

  Widget _buildForm() {
    return Column(
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
        Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Nome',
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Email',
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ElevatedButton(
            child: Text('Salvar'),
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
            ),
            onPressed: () {},

          )
        ),
      ],
    );
  }
}