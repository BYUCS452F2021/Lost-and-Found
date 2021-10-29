import 'dart:convert';

import 'package:http/http.dart';
import 'package:lost_and_found/models/post.dart';
import 'package:lost_and_found/utils/constants.dart';

class PostService {
  static createPost(user, description, photo ) async {
    final response = await post(
      Uri.parse(Constants.localhost()+'/api/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'founder_id': user.id,
        'object_name': 'test',
        'type': 'test-type',
        'photo': photo,
        'is_requested': '0',
        'color': 'test-color',
        'description': description,
        'found_date': DateTime.now().millisecondsSinceEpoch.toString(),
        'reported_date': DateTime.now().millisecondsSinceEpoch.toString(),
      }),
    );
    if (response.statusCode != 200) {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to create a user.');
    }
  }

  static Future<Post> getPost(int id) async {
    final response = await get(
      Uri.parse(Constants.localhost()+'/api/posts/'+id.toString()), //TODO: check the uri
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Exception('Failed to get a post.');
    }
    
    return serialize(response.body)[0];   
  }

  static List<Post> serialize(String responseBody) {
    Map<String, dynamic> decoded = jsonDecode(responseBody);
    Iterable list = decoded['data'];
    List<Post> posts = list.map((i) => Post.fromJson(i)).toList();

    return posts;
  }

  static Future<List<Post>> getPosts() async {
    final url = Uri.parse(Constants.localhost() +'/api/posts');
    Response response = await get(url);
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Exception('Failed to get posts.');
    }
    return serialize(response.body);
    
  }
}