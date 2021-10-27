import "package:flutter/material.dart";
import 'package:lost_and_found/utils/constants.dart';
import 'package:lost_and_found/widgets/header.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText:  Constants.Profile),
      body: Text(Constants.Profile),
    );
  }
}
