import 'package:flutter/material.dart';
import 'package:multi_select/multi_select_dialog.dart';

class UsingDialog extends StatefulWidget {
  @override
  _UsingDialogState createState() => _UsingDialogState();
}

class _UsingDialogState extends State<UsingDialog> {
  final List<MultiSelectDialogItem<int>> items = List.generate(
    30,
    (index) => MultiSelectDialogItem(index + 1, 'Item Number: ${index + 1}'),
  );
  Set<int> selectedValues;

  void submit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Items(s) selected'),
          content: Container(
            color: Colors.grey[200],
            child: Wrap(
              spacing: 10.0,
              children: selectedValues.map((item) {
                return Chip(
                  backgroundColor: Colors.yellow,
                  label: Text('item $item'),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _showMultiSelect() async {
    selectedValues = await showDialog(
      context: context,
      builder: (context) {
        return MultiSelectDialog(
          title: 'Select Item(s)',
          items: items,
          initialSelectedValues: selectedValues,
        );
      },
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Dialog/Wrap/Chip'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _showMultiSelect,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.black54,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Wrap(
                          spacing: 10.0,
                          children: selectedValues == null ||
                                  selectedValues.length == 0
                              ? [Container()]
                              : selectedValues.map(
                                  (v) {
                                    return Chip(
                                      label: Text('item $v'),
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      backgroundColor: Colors.redAccent,
                                      elevation: 6,
                                      onDeleted: () {
                                        setState(() {
                                          selectedValues.remove(v);
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        child: Icon(Icons.list),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text('SUBMIT'),
              onPressed: selectedValues == null || selectedValues.length == 0
                  ? null
                  : submit,
            ),
          ],
        ),
      ),
    );
  }
}
