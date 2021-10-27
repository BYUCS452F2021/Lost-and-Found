import 'package:flutter/material.dart';
import 'package:lost_and_found/utils/constants.dart';
import 'package:lost_and_found/widgets/header.dart';

class Profile extends StatefulWidget {
  final Function logout;
  Profile(this.logout);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText:  Constants.Profile),
      body: RaisedButton(
        child: Text("Logout"),
        onPressed: () {
          widget.logout();
        }
      ),
    );
  }
}
