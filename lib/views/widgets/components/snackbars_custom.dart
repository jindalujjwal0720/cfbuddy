import 'package:flutter/material.dart';

class CustomSnackbars extends StatelessWidget {
  const CustomSnackbars({super.key});
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  SnackBar errorSnackbar(String message) {
    return SnackBar(
      content: snackBarDesign(message, Icons.cancel_outlined, Colors.red),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

Widget snackBarDesign(String message, IconData? icon, MaterialColor color) {
  return Container(
    decoration: BoxDecoration(
        color: color[50], borderRadius: BorderRadius.circular(8.0)),
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: color[400],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    ),
  );
}
