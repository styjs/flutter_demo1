import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget
{

  Widget _itemBuilder(BuildContext context, int index)
  {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: _itemBuilder,
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget
{
  List<Widget> _buildTiles(int length)
  {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.black12,
        alignment: Alignment.center,
        child: Text('Item $index', style: TextStyle(fontSize: 16.0, color: Colors.black54))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      // crossAxisCount: 3,
      maxCrossAxisExtent: 150.0,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      dragStartBehavior: DragStartBehavior.down,
      scrollDirection: Axis.vertical,
      children: _buildTiles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget
{
  List<Widget> _buildTiles(int length)
  {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.black12,
        alignment: Alignment.center,
        child: Text('Item $index', style: TextStyle(fontSize: 16.0, color: Colors.black54))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      dragStartBehavior: DragStartBehavior.down,
      scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget
{
  Widget _itemBuilder(BuildContext context, int index)
  {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
              ),
            ],
          )
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _itemBuilder
    );
  }
}

class PageViewDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      // pageSnapping: false,
      // scrollDirection: Axis.vertical,
      // reverse: true,
      onPageChanged: (_currentPage) => {debugPrint("Current Page $_currentPage")},
      controller: PageController(
        initialPage: 1,
        // keepPage: false,
        viewportFraction: 0.85
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment.center,
          child: Text(
            'ONE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0
            )
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment.center,
          child: Text(
            'TWO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0
            )
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment.center,
          child: Text(
            'THERE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0
            )
          ),
        )
      ]
    );
  }
}
