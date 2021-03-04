import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((post) {
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(post.title.substring(0, 1)),
                    ),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    // child: Text(post.description, maxLines: 3, overflow: TextOverflow.ellipsis,)
                    child: Text(post.description)
                  ),
                  ButtonTheme(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {},
                          child: Text('like'.toUpperCase())
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text('read'.toUpperCase())
                        ),
                      ],
                    )
                  )
                ]
              ),
            );
          }).toList(),
        )
      ),
    );
  }
}