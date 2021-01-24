import 'package:flutter/material.dart';
import '../services/posts.service.dart';
import '../models/postsModels.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}): super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PostService postserv = new PostService();
  @override
  Widget build(BuildContext context) {
    final dat = postserv.getPosts(4);
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<PostModel>>(
          future: dat,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error); 
            return /*snapshot.hasData ? */ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final posts = snapshot.data[index];
                return Center(
                  child: Row(
                    children: <Widget>[
                      ListTile(
                        title: Text(posts.user.name[0]),
                        subtitle: Text(posts.title),
                      ),
                      ListBody(
                        children: [Text(posts.description)]
                      )
                    ]
                  )
                );
              }
              );// : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
