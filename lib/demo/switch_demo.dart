import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = false;

  void _onChanged (bool value) {
    setState(() {
      _switchItemA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SwitchListTile(
            value: _switchItemA,
            onChanged: _onChanged,
            activeColor: Colors.blueAccent,
            title: Text('Switch Item A'),
            subtitle: Text('Description'),
            secondary: Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
            selected: _switchItemA,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(_switchItemA ? '(^__^)' : '(-__-)'),
              // Switch(
              //   value: _switchItemA,
              //   onChanged: _onChanged,
              //   activeColor: Colors.blueAccent,
              // )
            ],
          )
        ],
      ),
    );
  }
}