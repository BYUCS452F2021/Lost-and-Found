import 'package:flutter/material.dart';
import 'package:lost_and_found/utils/constants.dart';
import 'package:lost_and_found/widgets/header.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  // Container buildSplashScreen() {
  //   return Container(
  //     color: Constants.lighterThemeColor,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         SvgPicture.asset('assets/image/upload.svg', height: 260.0),
  //         Padding(

  //         )

  //       ]
  //     )
  //   )
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText:  Constants.Upload),
      body: Text(Constants.Upload),
    );
  }
}
