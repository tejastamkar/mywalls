// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
// import 'fruits.dart';

class FruitsCards extends StatelessWidget {
  // final Fruits fruits;
  final name, color;
  final Function delete;
  FruitsCards({this.name, this.color, required this.delete});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 24.0, color: Colors.grey[600]),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              color,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                delete();
              },
              label: Text('Delete'),
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
