import 'package:flutter/material.dart';

List<Color?> chipColors = [
  Colors.amber[50],
  Colors.green[50],
  Colors.red[50],
  Colors.blue[50],
];

Widget tagChip(String content) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
    margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
    decoration: BoxDecoration(
      color: chipColors[content.codeUnitAt(0) % chipColors.length],
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Text(
      content,
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      ),
    ),
  );
}
