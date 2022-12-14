import 'package:flutter/material.dart';

class ErrorStates extends StatelessWidget {
  const ErrorStates({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget basicErrorWidget(void Function() onPressed) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Something went wrong!"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: onPressed,
                child: const Text("Reload"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
