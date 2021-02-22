import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Slider(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueAccent.withOpacity(0.3),
            divisions: 10,
            min: 0.0,
            max: 10.0,
            label: '${_sliderValue}',
          ),
          Text('SliderValue: ${_sliderValue}')
        ],
      ),
    );
  }
}