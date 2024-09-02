import 'package:flutter/material.dart';

class SecTestDataTable extends StatefulWidget {
  const SecTestDataTable({super.key});

  @override
  State<SecTestDataTable> createState() => _SecTestDataTableState();
}

class _SecTestDataTableState extends State<SecTestDataTable> {
  bool _sortAscending = true;
  int _sortColumnIndex = 0;
  List<User> _users = [
    User(id: 1, name: 'John Doe', age: 25),
    User(id: 2, name: 'Jane Doe', age: 28),
    User(id: 3, name: 'Alex Smith', age: 30),
    User(id: 4, name: 'Alice Johnson', age: 22),
  ];

  void _sort<T>(Comparable<T> Function(User user) getField, int columnIndex,
      bool ascending) {
    _users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        columns: <DataColumn>[
          DataColumn(
            label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold)),
            numeric: true,
            onSort: (int columnIndex, bool ascending) =>
                _sort((user) => user.id, columnIndex, ascending),
          ),
          DataColumn(
            label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
            onSort: (int columnIndex, bool ascending) =>
                _sort((user) => user.name, columnIndex, ascending),
          ),
          DataColumn(
            label: Text('Age', style: TextStyle(fontWeight: FontWeight.bold)),
            numeric: true,
            onSort: (int columnIndex, bool ascending) =>
                _sort((user) => user.age, columnIndex, ascending),
          ),
        ],
        rows: _users.map((user) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text('${user.id}')),
              DataCell(Text(user.name)),
              DataCell(Text('${user.age}')),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class User {
  User({required this.id, required this.name, required this.age});

  final int id;
  final String name;
  final int age;
}
