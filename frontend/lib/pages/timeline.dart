import 'package:flutter/material.dart';
import 'package:lost_and_found/main.dart';
import 'package:lost_and_found/models/post.dart';
import 'package:lost_and_found/utils/post_service.dart';
import 'package:lost_and_found/widgets/header.dart';
import 'package:lost_and_found/widgets/progress.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  late List<Post> posts;
  bool isLoading = true;
  initState() {
    super.initState();
    PostService.getPosts().then((List<Post> items) => setState(() {
          posts = items;
          isLoading = false;
        }));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: isLoading
          ? circularProgress()
          : Padding(
              padding: const EdgeInsets.all(32.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          child: Text('Send request to server'),
                          onPressed: () {
                            setState(() {
                              PostService.getPosts()
                                  .then((List<Post> users) => setState(() {
                                        print(users);
                                      }));
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: posts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text('Item: ${posts[index].name}'),
                                subtitle: Text(posts[index].description),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
