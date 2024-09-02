import 'package:flutter/material.dart';

class TrySecTestDataTable extends StatefulWidget {
  const TrySecTestDataTable({super.key});

  @override
  State<TrySecTestDataTable> createState() => _TrySecTestDataTableState();
}

class _TrySecTestDataTableState extends State<TrySecTestDataTable> {
  bool _sortAscending = true;
  int _sortColumnIndex = 0;
  final List<Store> _stores = [
    Store(code: 'F001', name: 'Burger', price: 5.00, sold: 120),
    Store(code: 'F002', name: 'Pizza', price: 8.50, sold: 80),
    Store(code: 'F003', name: 'Salad', price: 4.00, sold: 150),
    Store(code: 'F004', name: 'Soda', price: 1.50, sold: 200),
  ];

  void _sort<T>(Comparable<T> Function(Store store) getField, int columnIndex,
      bool ascending) {
    _stores.sort((a, b) {
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
              label: const Text('Code',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onSort: (columnIndex, ascending) =>
                  _sort((store) => store.code, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Name',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onSort: (columnIndex, ascending) =>
                  _sort((store) => store.name, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Price',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              numeric: true,
              onSort: (columnIndex, ascending) =>
                  _sort((store) => store.price, columnIndex, ascending),
            ),
            DataColumn(
              label: const Text('Sold Pieces',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              numeric: true,
              onSort: (columnIndex, ascending) =>
                  _sort((store) => store.sold, columnIndex, ascending),
            ),
          ],
          rows: _stores.map((store) {
            return DataRow(cells: <DataCell>[
              DataCell(Text(store.code)),
              DataCell(Text(store.name)),
              DataCell(Text('\$${store.price.toStringAsFixed(2)}')),
              DataCell(Text('${store.sold}')),
            ]);
          }).toList()),
    );
  }
}

class Store {
  Store(
      {required this.code,
      required this.name,
      required this.price,
      required this.sold});

  final String code;
  final String name;
  final double price;
  final int sold;
}
