import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';

import '../main.dart';

class MyHomePageTest1 extends ConsumerWidget {
  const MyHomePageTest1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollenLogic = ref.watch(pollenDataProvider(Coordinates(45, 47)));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pollenLogic.when(
              data: (data) => Text(data.toString()),
              error: (Object error, StackTrace stackTrace) {
                return Text(error.toString());
              },
              loading: () => const Text('loading...'),
            ),
            FloatingActionButton(
              onPressed: () => context.go('/dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}

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
