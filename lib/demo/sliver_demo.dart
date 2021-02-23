import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                debugPrint("Url: ${posts[index].imageUrl}");
                return Container(
                  child: Image.network(
                    posts[index].imageUrl,
                    fit: BoxFit.cover,
                  )
                );
              },
              childCount: posts.length
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0
            )
          )
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
