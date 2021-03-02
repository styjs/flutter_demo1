import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              // onSelectAll: (bool value) {
              //   debugPrint('valuea $value');
              // },
              columns: [
                DataColumn(
                  label: Text('Title'),

                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;

                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }

                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  }
                ),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('Image')),
              ],
              rows: posts.map((item) => DataRow(
                selected: item.selected,
                onSelectChanged: (bool value) {
                  debugPrint('value $value');
                  setState(() {
                    if (item != value) {
                      item.selected = value;
                    }
                  });
                },
                cells: [
                  DataCell(Text(item.title)),
                  DataCell(Text(item.author)),
                  DataCell(Image.network(item.imageUrl))
                ],
              )).toList()
            )
          ],
        )
      ),
    );
  }
}