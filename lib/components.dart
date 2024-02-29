import 'package:flutter/material.dart';

Widget buildGridItem(String element) {
  return Card(
    elevation: 5.0,
    child: Center(
      child: Text(
        element,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
