import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _counter = 0;

  void _addCounter () {
    setState(() {
      _counter++;
      // _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagement'),
        elevation: 0.0,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CounterDisplay(_counter, _addCounter)
            ]
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add',
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _addCounter,
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int counter;
  final VoidCallback _onPressed;

  CounterDisplay(this.counter, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('$counter'),
      onPressed: _onPressed,
    );
  }
}