import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MarksDataSource extends DataGridSource {
  MarksDataSource() {
    _marks = [
      DataGridRow(cells: [
        DataGridCell(columnName: 'subject', value: 'Math'),
        DataGridCell(columnName: 'exercises', value: 100),
        DataGridCell(columnName: 'test', value: 90),
        DataGridCell(columnName: 'final', value: 80),
        DataGridCell(columnName: 'total', value: 85),
      ]),
      DataGridRow(cells: [
        DataGridCell(columnName: 'subject', value: 'Physics'),
        DataGridCell(columnName: 'exercises', value: 100),
        DataGridCell(columnName: 'test', value: 88),
        DataGridCell(columnName: 'final', value: 100),
        DataGridCell(columnName: 'total', value: 92),
      ]),
      DataGridRow(cells: [
        DataGridCell(columnName: 'subject', value: 'Math'),
        DataGridCell(columnName: 'exercises', value: 100),
        DataGridCell(columnName: 'test', value: 90),
        DataGridCell(columnName: 'final', value: 80),
        DataGridCell(columnName: 'total', value: 85),
      ]),
      DataGridRow(cells: [
        DataGridCell(columnName: 'subject', value: 'Physics'),
        DataGridCell(columnName: 'exercises', value: 100),
        DataGridCell(columnName: 'test', value: 88),
        DataGridCell(columnName: 'final', value: 100),
        DataGridCell(columnName: 'total', value: 92),
      ]),
      DataGridRow(cells: [
        DataGridCell(columnName: 'subject', value: 'Math'),
        DataGridCell(columnName: 'exercises', value: 100),
        DataGridCell(columnName: 'test', value: 90),
        DataGridCell(columnName: 'final', value: 80),
        DataGridCell(columnName: 'total', value: 85),
      ]),
    ];
  }

  List<DataGridRow> _marks = [];

  @override
  List<DataGridRow> get rows => _marks;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}