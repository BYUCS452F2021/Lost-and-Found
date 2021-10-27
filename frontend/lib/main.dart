import 'package:flutter/material.dart';
import 'package:lost_and_found/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LostAndFound',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
