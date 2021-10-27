import 'package:flutter/material.dart';
import 'package:lost_and_found/utils/constants.dart';
import 'package:lost_and_found/widgets/header.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: Constants.Search),
      body: Text(Constants.Search),
    );
  }
}

class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("User Result");
  }
}
