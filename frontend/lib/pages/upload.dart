import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_and_found/utils/constants.dart';
import 'package:lost_and_found/widgets/custom_image.dart';

class Upload extends StatefulWidget {
  var user;

  Upload({required this.user});

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  late File file;
  bool fileExists = false;

  handleTakePhoto() async {
    Navigator.pop(context);
    File file = (await ImagePicker().pickImage(
        source: ImageSource.camera, maxHeight: 675, maxWidth: 960)) as File;
    setState(() {
      this.file = file;
      this.fileExists = true;
    });
  }

  handleChooseFromGallery() async {
    // Navigator.pop(context);
    File file = (await ImagePicker().pickImage(source: ImageSource.gallery)) as File;
    setState(() {
      this.file = file;
      this.fileExists = true;
    });
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text(Constants.createPost),
            children: <Widget>[
              SimpleDialogOption(
                  child: Text("Photo with Camera"), onPressed: handleTakePhoto),
              SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: handleChooseFromGallery,
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  Container buildSplashScreen() {
    return Container(
        color: Constants.lighterThemeColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Upload"),
              Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      Constants.reportItem,
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                    color: Colors.deepOrange,
                    onPressed: () => selectImage(context),
                  ))
            ]));
  }

  clearImage() {}

  buildUploadForm() {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white70,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: clearImage,
            ),
            title: Text(
              'Caption Post',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              FlatButton(
                child: Text("Post",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                onPressed: () => print("hi"),
              )
            ]),
        body: ListView(
          children: <Widget>[
            Container(
              height: 220.0,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(file),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: cachedNetworkImage(widget.user.photo),
              ),
              title: Container(
                width: 250.0,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Write a caption...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.pin_drop, color: Colors.orange, size:35.0),
              title: Container(
                width:250.0,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Where did you find the item?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              width: 200.0,
              height: 100.0,
              alignment: Alignment.center,
              child: RaisedButton.icon(
                label: Text('Use current location', style: TextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  ),
                color: Colors.blue,
                onPressed: () => print('get user location'),
                icon: Icon(
                  Icons.my_location,
                  color: Colors.white,
                )
              )
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return fileExists == false ? buildSplashScreen() : buildUploadForm();
  }
}
