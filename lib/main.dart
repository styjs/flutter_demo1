import 'package:flutter/material.dart';
import 'demo/list_view_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/layout_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70
      ),
    );
  }
}

class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'navigation',
          //   onPressed: () => debugPrint('Navigation button is pressed!'),
          // ),
          title: Text('NIHAO'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'navigation',
              onPressed: () => debugPrint('Search button is pressed!'),
            )
          ],
          elevation: 0.0,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.local_laundry_service)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.black54,
            indicatorWeight: 5.0,
          ),
        ),
        bottomNavigationBar: BottomNavigationBarDemo(),
        body: TabBarView(children: <Widget>[
          // Icon(Icons.local_florist, size: 128.0, color: Colors.black12,),
          ListViewDemo(),
          BasicDemo(),
          LayoutDemo(),
        ]),
        drawer: DrawerDemo()
      )
    );
  }
}

