import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  final int image;
  final String name;
  final String email;
  final GestureTapCallback onTap;

  const HeaderView({Key key, this.image, this.name, this.email, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: InkWell(
          onTap: () { onTap(); },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset("images/$image.jpg")
          )
      ),
      accountName: Text(name),
      accountEmail: Text(email),
    );
  }
}
