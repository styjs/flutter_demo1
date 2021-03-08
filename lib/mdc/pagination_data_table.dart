import 'package:flutter/material.dart';
import '../model/post.dart';

class PagenationDataTableDemo extends StatefulWidget {
  @override
  _PagenationDataTableDemoState createState() => _PagenationDataTableDemoState();
}

class _PagenationDataTableDemoState extends State<PagenationDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  final _postsDataSource = PostsDataSource();

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
            PaginatedDataTable(
              header: Text('Posts'),
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              source: _postsDataSource,
              rowsPerPage: 10,// 每页显示行数
              // onSelectAll: (bool value) {
              //   debugPrint('valuea $value');
              // },
              columns: [
                DataColumn(
                  label: Text('Title'),
                  /**
                   * ascending 是否时升序
                   */
                  onSort: (int index, bool ascending) {

                    _postsDataSource._sort((post) => post.title.length, ascending);

                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;
                    });
                  }
                ),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('Image')),
                // DataColumn(label: Text('Image')),
              ],
            )
          ],
        )
      ),
    );
  }
}

class PostsDataSource extends DataTableSource
{
  final _posts = posts;
  final _selectedCount = 0;

  DataRow getRow(int index) {
    final Post post = _posts[index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
        // DataCell(Image.network(post.imageUrl)),
      ]
    );
  }

  int get rowCount => _posts.length;

  // 获取rowCount是否时近似值
  bool get isRowCountApproximate => false;

  // 获取选中行数的时候
  int get selectedRowCount => _selectedCount;

  void _sort(getFiled(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getFiled(a);
      final bValue = getFiled(b);

      return Comparable.compare(aValue, bValue);
    });
  }
}