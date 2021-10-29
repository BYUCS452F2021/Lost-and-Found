import 'dart:io';
import 'dart:ui';

class Constants {
  static const String lostAndFound = 'Lost && Found';
  static const String lostItems = 'Lost Items';
  static const String Upload = 'Upload';
  static const String Profile = 'Profile';
  static const String Search = 'Search';
  static const String reportItem = 'Report Item';
  static const String createPost = 'Create Post';
  static const Color lighterThemeColor = Color.fromRGBO(1,45,95,1);
  static const Color darkerThemeColor = Color.fromRGBO(0,24,50,1);
  static Function localhost = () {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:5000';
    else // for iOS simulator
      return 'http://localhost:5000';
  };
}