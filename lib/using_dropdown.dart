import 'package:flutter/material.dart';

class UsingDropdown extends StatefulWidget {
  @override
  _UsingDropdownState createState() => _UsingDropdownState();
}

class _UsingDropdownState extends State<UsingDropdown> {
  final List<String> items =
      List.generate(30, (index) => 'Item number: ${index + 1}');
  final List<String> selectedItems = <String>[];

  void submit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Item(s) selected'),
          content: Container(
            color: Colors.grey[200],
            child: Wrap(
              spacing: 10.0,
              children: selectedItems.map((item) {
                return Chip(
                  backgroundColor: Colors.yellow,
                  label: Text(item),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Dropdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: DropdownButton(
                hint: Text('Select items you want!'),
                value: selectedItems.isEmpty ? null : selectedItems.last,
                onChanged: (String newValue) {
                  setState(() {
                    if (selectedItems.contains(newValue)) {
                      selectedItems.remove(newValue);
                    } else {
                      selectedItems.add(newValue);
                    }
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.check,
                          color: selectedItems.contains(value)
                              ? Colors.black
                              : Colors.transparent,
                        ),
                        SizedBox(width: 16),
                        Text(value),
                      ],
                    ),
                  );
                }).toList(),
                underline: Container(
                  height: 1,
                  color: Colors.black,
                ),
                // isExpanded: true,
                itemHeight: kMinInteractiveDimension * 1.2,
              ),
            ),
            RaisedButton(
              onPressed: selectedItems.isEmpty ? null : submit,
              child: Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}
