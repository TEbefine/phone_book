import 'package:flutter/material.dart';
import 'package:phone_book/work/third_test_data_table.dart';

class TryThirdDataTable extends StatefulWidget {
  const TryThirdDataTable({super.key});

  @override
  State<TryThirdDataTable> createState() => _TryThirdDataTableState();
}

class _TryThirdDataTableState extends State<TryThirdDataTable> {
  int _rowsPerpage = PaginatedDataTable.defaultRowsPerPage;
  final MyDataTableSource _data = MyDataTableSource();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
          header: const Text('Books'),
          rowsPerPage: _rowsPerpage,
          onRowsPerPageChanged: (int? value) {
            setState(() {
              _rowsPerpage = value ?? PaginatedDataTable.defaultRowsPerPage;
            });
          },
          columns: const <DataColumn>[
            DataColumn(label: Text('ISBN')),
            DataColumn(label: Text('Names')),
            DataColumn(label: Text('Years')),
            DataColumn(label: Text('Types')),
            DataColumn(label: Text('Prices')),
          ],
          source: _data),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  final List<Book> _books = [
    Book(
        isbn: '978-0451524935',
        name: '1984',
        year: 1949,
        type: 'Dystopian',
        price: 10.99),
    Book(
        isbn: '978-0061120084',
        name: 'To Kill a Mockingbird',
        year: 1960,
        type: 'Dystopian',
        price: 10.99),
    Book(
        isbn: '978-0451524935',
        name: '1984',
        year: 1949,
        type: 'Dystopian',
        price: 10.99),
    Book(
        isbn: '978-0451524935',
        name: '1984',
        year: 1949,
        type: 'Dystopian',
        price: 10.99),
    Book(
        isbn: '978-0451524935',
        name: '1984',
        year: 1949,
        type: 'Dystopian',
        price: 10.99),
    Book(
        isbn: '978-0451524935',
        name: '1984',
        year: 1949,
        type: 'Dystopian',
        price: 10.99),
    Book(
        isbn: '978-0451524935',
        name: '1984',
        year: 1949,
        type: 'Dystopian',
        price: 10.99),
    Book(
        isbn: '978-0451524935',
        name: '1984',
        year: 1949,
        type: 'Dystopian',
        price: 10.99),
    Book(
        isbn: '978-0451524935',
        name: '1984',
        year: 1949,
        type: 'Dystopian',
        price: 10.99),
    Book(
        isbn: '978-0451524935',
        name: '1984',
        year: 1949,
        type: 'Dystopian',
        price: 10.99),
  ];

  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    throw UnimplementedError();
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => throw UnimplementedError();

  @override
  // TODO: implement rowCount
  int get rowCount => throw UnimplementedError();

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => throw UnimplementedError();
}

class Book {
  Book(
      {required this.isbn,
      required this.name,
      required this.year,
      required this.type,
      required this.price,
      this.selected = false});

  final String isbn;
  final String name;
  final int year;
  final String type;
  final double price;
  bool selected;
}
