import 'package:flutter/material.dart';

class ThirdTestDataTable extends StatefulWidget {
  const ThirdTestDataTable({super.key});

  @override
  State<ThirdTestDataTable> createState() => _ThirdTestDataTableState();
}

class _ThirdTestDataTableState extends State<ThirdTestDataTable> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  final MyDataTableSource _data = MyDataTableSource();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: PaginatedDataTable(
          header: const Text('Users'),
          rowsPerPage: _rowsPerPage,
          onRowsPerPageChanged: (int? value) {
            setState(() {
              _rowsPerPage = value ?? PaginatedDataTable.defaultRowsPerPage;
            });
          },
          columns: const <DataColumn>[
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Actions')),
          ],
          source: _data,
        ),
      ),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  final List<User> _users = [
    User(id: 1, name: 'John Doe', age: 25),
    User(id: 2, name: 'Jane Doe', age: 28),
    User(id: 3, name: 'Alex Smith', age: 30),
    User(id: 4, name: 'Alice Johnson', age: 22),
    User(id: 5, name: 'David Brown', age: 35),
    User(id: 1, name: 'John Doe', age: 25),
    User(id: 2, name: 'Jane Doe', age: 28),
    User(id: 3, name: 'Alex Smith', age: 30),
    User(id: 4, name: 'Alice Johnson', age: 22),
    User(id: 5, name: 'David Brown', age: 35),
    User(id: 1, name: 'John Doe', age: 25),
    User(id: 2, name: 'Jane Doe', age: 28),
    User(id: 3, name: 'Alex Smith', age: 30),
    User(id: 4, name: 'Alice Johnson', age: 22),
    User(id: 5, name: 'David Brown', age: 35),
  ];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _users.length) return null;
    final User user = _users[index];
    return DataRow.byIndex(
      index: index,
      selected: user.selected,
      onSelectChanged: (bool? value) {
        if (value != null) {
          _users[index].selected = value;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(Text('${user.id}')),
        DataCell(Text(user.name)),
        DataCell(Text('${user.age}')),
        DataCell(
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _deleteUser(index);
            },
          ),
        ),
      ],
    );
  }

  void _deleteUser(int index) {
    _users.removeAt(index);
    notifyListeners();
  }

  @override
  int get rowCount => _users.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _users.where((user) => user.selected).length;
}

class User {
  User(
      {required this.id,
      required this.name,
      required this.age,
      this.selected = false});

  final int id;
  final String name;
  final int age;
  bool selected;
}
