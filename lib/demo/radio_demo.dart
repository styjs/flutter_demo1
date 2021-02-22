import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _groupValue = 0;

  void _handleChangeRadioValue (value) {
    setState(() {
      _groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('RadioGroup ${_groupValue + 1}'),
          SizedBox(height: 16.0),
          RadioListTile(
            value: 0,
            groupValue: _groupValue,
            onChanged: _handleChangeRadioValue,
            activeColor: Colors.blueAccent,
            title: Text('Options A'),
            subtitle: Text('Decoration'),
            secondary: Icon(Icons.filter_1),
            selected: _groupValue == 0,
          ),
          RadioListTile(
            value: 1,
            groupValue: _groupValue,
            onChanged: _handleChangeRadioValue,
            activeColor: Colors.blueAccent,
            title: Text('Options B'),
            subtitle: Text('Decoration'),
            secondary: Icon(Icons.filter_2),
            selected: _groupValue == 1,
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Radio(
          //       value: 0,
          //       groupValue: _groupValue,
          //       onChanged: _handleChangeRadioValue,
          //       activeColor: Colors.black87
          //     ),
          //     Radio(
          //       value: 1,
          //       groupValue: _groupValue,
          //       onChanged: _handleChangeRadioValue,
          //       activeColor: Colors.black87
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}