import 'package:flutter/material.dart';

class FirstTestDataTable extends StatelessWidget {
  const FirstTestDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
          DataColumn(label: Text('Nationality')),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('1')),
              DataCell(Text('John Doe')),
              DataCell(Text('25')),
              DataCell(Text('French')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2')),
              DataCell(Text('Jane Doe')),
              DataCell(Text('28')),
              DataCell(Text('Japanese')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('3')),
              DataCell(Text('Alex Smith')),
              DataCell(Text('30')),
              DataCell(Text('Thai')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('4')),
              DataCell(Text('Mr. Been')),
              DataCell(Text('69')),
              DataCell(Text('British')),
            ],
          ),
        ],
      ),
    );
  }
}
