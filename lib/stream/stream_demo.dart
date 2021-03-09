import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamDemoHome()
          ],
        )
      ),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() {
    return _StreamDemoHomeState();
  }
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController<String>();// 只能定义一次
    _streamDemo = StreamController.broadcast();// 只能定义一次
    _sinkDemo = _streamDemo.sink;// 只能定义一次

    print('Start listening on a stream.');
    // _streamDemoSubscription = _streamDemo.listen(onData, onError: onError);
    _streamDemoSubscription = _streamDemo.stream.listen(onData);
    _streamDemoSubscription = _streamDemo.stream.listen(onDataTwo);
    print('Initial compeleted');
  }

  void onError (data) {
    print('$data');
  }

  void onData (String data) {
    setState(() {
      _data = data;
    });
    print('$data');
  }

  void onDataTwo (String data) {
    print('$data 2');
  }

  void _onAdd () async {
    print('Add Data to stream.');

    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  void _onPause () {
    _streamDemoSubscription.pause();
    print('Pause subcription');
  }

  void _onResume () {
    _streamDemoSubscription.resume();
    print('Resume subcription');
  }

  void _onCancel () {
    _streamDemoSubscription.cancel();
    print('Cancel subcription');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return 'hello~';
    // throw 'Somthing happened';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(_data),
          StreamBuilder(
            stream: _streamDemo.stream,
            initialData: '......',
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: _onAdd,
                child: Text('Add')
              ),
              FlatButton(
                onPressed: _onPause,
                child: Text('Pause')
              ),
              FlatButton(
                onPressed: _onResume,
                child: Text('Resume')
              ),
              FlatButton(
                onPressed: _onCancel,
                child: Text('Cancel')
              ),
            ],
          )
        ]
      )
    );
  }
}