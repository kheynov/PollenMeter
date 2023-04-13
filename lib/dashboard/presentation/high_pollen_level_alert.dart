import 'package:flutter/material.dart';

class HighPollenLevelAlert extends StatelessWidget {
  final String msg;

  const HighPollenLevelAlert({super.key, required this.msg});
//TODO: proper theming instead of constants
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.warning, color: Colors.red),
            const SizedBox(width: 10),
            Text(
              msg,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
