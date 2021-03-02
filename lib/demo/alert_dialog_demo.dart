import 'package:flutter/material.dart';
import 'dart:async';

enum ACTOIN {
  Ok,
  Cancel
}

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';

  Future<void> _openDialog () async {
    final action = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context, ACTOIN.Cancel);
              },
              child: Text('Cancel')
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, ACTOIN.Ok);
              },
              child: Text('Ok')
            ),
          ],
        );
      }
    );

    setState(() {
      if (action == ACTOIN.Ok) {
        setState(() {
          _choice = 'Ok';
        });
      }
      if (action == ACTOIN.Cancel) {
        setState(() {
          _choice = 'Cancel';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your choice is: $_choice'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: _openDialog,
                  child: Text('Open dilog'),
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}