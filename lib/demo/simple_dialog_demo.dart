import 'package:flutter/material.dart';
import 'dart:async';

enum Option
{
  A, B, C
}

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = "Nothing";

  Future<void> _showSimpleDialog () async {
    final option = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('SimpleDialog'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Opation A'),
              onPressed: () {
                Navigator.pop(context, Option.A);
              },
            ),
            SimpleDialogOption(
              child: Text('Opation B'),
              onPressed: () {
                Navigator.pop(context, Option.B);
              },
            ),
            SimpleDialogOption(
              child: Text('Opation C'),
              onPressed: () {
                Navigator.pop(context, Option.C);
              },
            )
          ],
        );
      }
    );

    debugPrint('option $option');

    switch (option) {
      case Option.A:
        setState(() {
          _choice = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _choice = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _choice = 'C';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Your Choice is: $_choice')
              ]
            )
          ],
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: _showSimpleDialog,
      ),
    );
  }
}