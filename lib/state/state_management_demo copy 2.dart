import 'package:flutter/material.dart';
// inherite

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
    return CounterProvider(
      counter: _counter,
      increseaCounter: _addCounter,
      child: Scaffold(
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
                // CouterWrapper(_counter, _addCounter)
                // inherite
                CouterWrapper()
              ]
            )
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.restore),
          tooltip: 'Add3',
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              _counter = 0;
            });
          },
        ),
      ),
    );
  }
}

class CouterWrapper extends StatelessWidget {
  // final int counter;
  // final VoidCallback _onPressed;

  // CouterWrapper(this.counter, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterDisplay(),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  // final int counter;
  // final VoidCallback _onPressed;

  // CounterDisplay(this.counter, this._onPressed);

  @override
  Widget build(BuildContext context) {
    final counter = CounterProvider.of(context).counter;
    final _onPressed = CounterProvider.of(context).increseaCounter;

    return ActionChip(
      label: Text('$counter'),
      onPressed: _onPressed,
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int counter;
  final VoidCallback increseaCounter;
  final Widget child;

  CounterProvider({
    this.counter,
    this.increseaCounter,
    this.child
  });

  // 获取CounterProvider实例中的State
  static CounterProvider of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}