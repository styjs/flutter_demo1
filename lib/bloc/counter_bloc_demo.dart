import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              _counterBloc.counter.add(1);
              // _counterBloc.log();
            },
          );
        }
      )
    );
  }
}

class CounterActiveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _counterBloc.counter.add(1);
        // _counterBloc.log();
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({Key key, this.child, this.bloc}) : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc
{
  num _count = 0;

  // 创建一个streamController 监听事件
  final _streamActionController = StreamController<int>();
  StreamSink<int> get counter => _streamActionController.sink;

  // 创建一个streamController 订阅消息
  final _streamController = StreamController<int>();
  Stream<int> get count => _streamController.stream;

  CounterBloc(){
    _streamActionController.stream.listen(onData);
  }

  void onData (int data) {
    // print('$data');
    _count = _count + data;
    _streamController.add(_count);
  }

  void log () {
    print('bloc');
  }
}