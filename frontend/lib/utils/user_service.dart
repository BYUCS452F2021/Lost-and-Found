import 'dart:convert';

import 'package:http/http.dart';
import 'package:lost_and_found/models/user.dart';
import 'package:lost_and_found/utils/constants.dart';

class UserService {
  static Future<User> createUser(user) async {
    final response = await post(
      Uri.parse(Constants.localhost()+'/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'byu_id': user.id,
        'name': user?.displayName,
        'email': user?.email,
        'is_student': '1',
        'phone_number': '801-203-0091',
      }),
    );
    if (response.statusCode != 200) {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to create a user.');
    }

    return serialize(response.body)[0];
  }

  static Future<User> getUser(String id) async {
    final response = await get(
      Uri.parse(Constants.localhost()+'/api/users/'+id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Exception('Failed to get a user.');
    }
    return serialize(response.body)[0];    
  }

   static List<User> serialize(String responseBody) {
    Map<String, dynamic> decoded = jsonDecode(responseBody);
    Iterable list = decoded['data'];
    List<User> users = list.map((i) => User.fromJson(i)).toList();

    return users;
  }

  static Future<List<User>> getUsers() async {
    final url = Uri.parse(Constants.localhost() +'/api/users');
    Response response = await get(url);
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Exception('Failed to get a user.');
    }
    return serialize(response.body);
  }

 
}