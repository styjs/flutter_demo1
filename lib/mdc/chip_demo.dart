import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _fruits = ['Apple', 'Banana', 'Lemon'];

  String _action = 'NOthing';

  List<String> _selected = [];

  String _chioce = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 0.0,
              children: <Widget>[
                Chip(
                  label: Text('life')
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange
                ),
                Chip(
                  label: Text('wanghao'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('浩'),
                  ),
                ),
                Chip(
                  label: Text('wanghao'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage('https://static.xianglinsen.com/e4582edf980e5ee4b0b29ca3c599fe000.7501326950696303'),
                  ),
                ),
                Chip(
                  label: Text('wanghao'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage('https://static.xianglinsen.com/e4582edf980e5ee4b0b29ca3c599fe000.7501326950696303'),
                  ),
                ),
                Chip(
                  label: Text('Del'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag!',
                ),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                  indent: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  children: _fruits.map((tag){
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _fruits.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  children: _fruits.map((tag){
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  children: _fruits.map((tag){
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChioceChip: $_chioce'),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  children: _fruits.map((tag){
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _chioce == tag,
                      selectedColor: Colors.black,
                      onSelected: (value) {
                        setState(() {
                          _chioce = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ]
            ),
          ]
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _fruits = ['Apple', 'Banana', 'Lemon'];

            _selected = [];

            _chioce = 'Lemon';
          });
        },
      ),
    );
  }
}