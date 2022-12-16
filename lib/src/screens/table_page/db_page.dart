import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/models/wom_model.dart';

class WomDbTablePage extends StatefulWidget {
  final List<WomRow> woms;

  const WomDbTablePage({Key? key, required this.woms}) : super(key: key);

  @override
  _WomDbTablePageState createState() => _WomDbTablePageState();
}

class _WomDbTablePageState extends State<WomDbTablePage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  _WomsDataSources? _womsDataSources;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_womsDataSources == null) {
      _womsDataSources = _WomsDataSources(context, widget.woms);
    }
  }

  void _sort<T>(
      Comparable<T>? getField(WomRow d), int columnIndex, bool ascending) {
    _womsDataSources!._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('DB'),
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(4),
          children: [
            PaginatedDataTable(
              header: Text('WOM DataBase'),
              rowsPerPage: _rowsPerPage!,
              onRowsPerPageChanged: (value) {
                setState(() {
                  _rowsPerPage = value;
                });
              },
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              onSelectAll: _womsDataSources!._selectAll,
              columns: [
                DataColumn(
                  label: Text(WomModel.dbId),
                  onSort: (columnIndex, ascending) =>
                      _sort<String>((d) => d.id, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text(WomModel.dbAim),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<String>((d) => d.aim, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text(WomModel.dbSourceId),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<String>((d) => d.sourceId, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text(WomModel.dbSourceName),
                  numeric: true,
                  onSort: (columnIndex, ascending) => _sort<String>(
                      (d) => d.sourceName, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text(WomModel.dbLat),
                  numeric: true,
                  onSort: (latIndex, ascending) => _sort<String>(
                      (d) => d.latitude.toString(), latIndex, ascending),
                ),
                DataColumn(
                  label: Text(WomModel.dbLong),
                  numeric: true,
                  onSort: (longIndex, ascending) => _sort<String>(
                      (d) => d.longitude.toString(), longIndex, ascending),
                ),
                DataColumn(
                  label: Text(WomModel.dbLive),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.spent, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text(WomModel.dbSecret),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<String>((d) => d.secret, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text(WomModel.dbTimestamp),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.timestamp, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text(WomModel.dbTransactionId),
                  numeric: true,
                  onSort: (columnIndex, ascending) => _sort<num>(
                      (d) => d.transactionId, columnIndex, ascending),
                ),
              ],
              source: _womsDataSources!,
            ),
          ],
        ),
      ),
    );
  }
}

class _WomsDataSources extends DataTableSource {
  _WomsDataSources(this.context, this.woms);

  final BuildContext context;
  final List<WomRow> woms;

  void _sort<T>(Comparable<T>? getField(WomRow d), bool ascending) {
    woms.sort((a, b) {
      final Comparable<T>? aValue = getField(a);
      final Comparable<T>? bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue!, bValue!)
          : Comparable.compare(bValue!, aValue!);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= woms.length) return null;
    final wom = woms[index];
    return DataRow.byIndex(
      index: index,
//      selected: wom.selected,
      /*onSelectChanged: (value) {
        if (wom.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          wom.selected = value;
          notifyListeners();
        }
      },*/
      cells: [
        DataCell(Text(wom.id)),
        DataCell(Text('${wom.aim}')),
        DataCell(Text(wom.sourceId.toString())),
        DataCell(Text(wom.sourceName)),
        DataCell(Text(wom.latitude.toString())),
        DataCell(Text(wom.longitude.toString())),
        DataCell(Text(WomStatus.values[wom.spent].toString().replaceAll('WomStatus.', ''))),
        DataCell(Text(wom.secret)),
        DataCell(Text('${DateTime.fromMillisecondsSinceEpoch(wom.timestamp)}')),
        DataCell(Text('${wom.transactionId}')),
      ],
    );
  }

  @override
  int get rowCount => woms.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool? checked) {
//    for (final WomModel dessert in _woms) {
//      dessert.selected = checked;
//    }
//    _selectedCount = checked ? _woms.length : 0;
//    notifyListeners();
  }
}
