import 'package:bloc1/utils/app_theme.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(String title, {List<Widget>? actions}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    ),
    actions: actions,
    elevation: 0,
    backgroundColor: CustomAppTheme().bgColor,
    foregroundColor: Colors.black87,
    toolbarHeight: 70,
  );
}
