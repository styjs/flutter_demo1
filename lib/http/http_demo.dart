import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),

      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();

    print(requestPost());
  }
  // https://resources.ninghao.net/demo/posts.json
  Future<List<Post>> requestPost() async {
    final response = await http.get(Uri.https("resources.ninghao.net", "/demo/posts.json"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      List<Post> posts = responseBody['posts']
        .map<Post>((item) => Post.fromJson(item))
        .toList();

      return posts;
    } else {
      throw Exception('Failed to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: requestPost(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }
        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.title),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList()
        );
      },
    );
  }
}

class Post {
  int id;
  String title;
  String author;
  String description;
  String imageUrl;

  Post(
    this.id,
    this.title,
    this.author,
    this.description,
    this.imageUrl
  );

  Post.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map toJson(Map json) => {
    'id': json['id'],
    'title': json['title'],
    'author': json['author'],
    'description': json['description'],
    'imageUrl': json['imageUrl'],
  };
}
