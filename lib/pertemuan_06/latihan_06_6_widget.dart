import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Data Table Widget')),
        body: Center(
          child: Container(
            child: DataTable(
              columns: [
                DataColumn(label: Text('Car Make')),
                DataColumn(label: Text('Model')),
                DataColumn(label: Text('Price')),
              ],
              rows: [
                DataRow(
                  cells: [DataCell(Text('Honda')), DataCell(Text('2010')), DataCell(Text('5000'))],
                ),
                DataRow(
                  cells: [DataCell(Text('Honda')), DataCell(Text('2011')), DataCell(Text('6000'))],
                ),
                DataRow(
                  cells: [DataCell(Text('Honda')), DataCell(Text('2012')), DataCell(Text('7000'))],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
