import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/main.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollenLogic = ref.watch(pollenDataProvider(
        Coordinates(45, 47))); //TODO: get coordinates from location
    pollenLogic.whenData((data) {});
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 70),
            pollenLogic.when(
              data: (data) {
                return const Text('');
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 125,
              child: Text('text)'),
              // ListView.separated(
              //   itemCount: 10,
              //   scrollDirection: Axis.horizontal,
              //   /*itemBuilder: (BuildContext context, int index) =>
              //       PollenConcentrationGauge(
              //           concentration: 20,
              //           progressBarColor: Colors.cyan,
              //           text: index.toString()),*/
              //   separatorBuilder: (BuildContext context, int index) =>
              //       const SizedBox(width: 10),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
