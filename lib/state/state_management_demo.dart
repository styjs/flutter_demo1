import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
// scoped_model
class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
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

        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.restore),
            tooltip: 'Add4',
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: model.restore,
          )
        ) ,
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
    // final counter = CounterProvider.of(context).counter;
    // final _onPressed = CounterProvider.of(context).increseaCounter;

    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text('${model.counter}'),
        onPressed: model.increasement,
      ),

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

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void restore() {
    _counter = 0;
    notifyListeners();
  }

  void increasement () {
    _counter++;
    notifyListeners();
  }
}