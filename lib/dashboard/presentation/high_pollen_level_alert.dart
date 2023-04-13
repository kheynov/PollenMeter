import 'package:flutter/material.dart';

class HighPollenLevelAlert extends StatelessWidget {
  final String msg;

  const HighPollenLevelAlert({super.key, required this.msg});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.warning, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 10),
            Text(
              msg,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
