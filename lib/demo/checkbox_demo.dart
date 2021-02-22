import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkBoxItemA = false;
  bool _checkBoxItemB = false;

  void onChangedA (bool value) {
    setState(() {
      _checkBoxItemA = value;
    });
  }

  void onChangedB (bool value) {
    setState(() {
      _checkBoxItemB = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Checkbox(
            //       value: _checkBoxItemA,
            //       onChanged: onChangedA,
            //       activeColor: Colors.brown,
            //     )
            //   ],
            // ),
            CheckboxListTile(
              value: _checkBoxItemB,
              onChanged: onChangedB,
              activeColor: Colors.cyan,
              title: Text('CheckboxListTile'),
              subtitle: Text('Decoration'),
              secondary: Icon(Icons.bookmark),
              selected: _checkBoxItemB,
            )
          ],
        )
      ),
    );
  }
}