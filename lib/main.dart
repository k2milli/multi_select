import 'package:flutter/material.dart';
import 'package:multi_select/multiple_select_pacakge.dart';
import 'package:multi_select/using_dialog.dart';
import 'package:multi_select/using_dropdown.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Selection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Select'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return UsingDropdown();
                      },
                    ),
                  );
                },
                child: Text(
                  'Using DropdownButton',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MultipleSelectPacakage();
                      },
                    ),
                  );
                },
                child: Text(
                  'Using multiple_select package',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return UsingDialog();
                      },
                    ),
                  );
                },
                child: Text(
                  'Using MultiSelectDialog',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
