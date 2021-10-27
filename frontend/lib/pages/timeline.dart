import 'package:flutter/material.dart';
import 'package:lost_and_found/utils/constants.dart';
import 'package:lost_and_found/widgets/header.dart';
import 'package:lost_and_found/widgets/progress.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: circularProgress(),

    );
  }

  //TODO: get Data
  //TODO: use ListView to create a list
}
