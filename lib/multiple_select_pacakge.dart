import 'package:flutter/material.dart';
import 'package:multiple_select/multi_drop_down.dart';
import 'package:multiple_select/multiple_select.dart';

class MultipleSelectPacakage extends StatefulWidget {
  @override
  _MultipleSelectPacakageState createState() => _MultipleSelectPacakageState();
}

class _MultipleSelectPacakageState extends State<MultipleSelectPacakage> {
  List<MultipleSelectItem> elements = List.generate(
    30,
    (index) => MultipleSelectItem.build(
      value: index,
      display: '$index display',
      content: '$index content',
    ),
  );

  List _selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Select Package'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(
                    color: Colors.grey[400],
                    width: 1.0,
                  ),
                ),
                child: MultipleDropDown(
                  placeholder: 'Select Item(s)',
                  disabled: false,
                  values: _selectedValues,
                  elements: elements,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
