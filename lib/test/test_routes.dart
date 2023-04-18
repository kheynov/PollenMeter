import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePageTest2 extends StatelessWidget {
  const MyHomePageTest2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)?.appTitle ?? ''),
            FloatingActionButton(
              onPressed: () => context.go('/dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePageTest3 extends StatelessWidget {
  const MyHomePageTest3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test 3'),
            FloatingActionButton(
              onPressed: () => context.go('/record'),
            ),
          ],
        ),
      ),
    );
  }
}
