import 'package:flutter/material.dart';
import 'package:pollen_meter/core/utils/logger.dart';

import '../core/utils/coordinates.dart';
import '../core/utils/di.dart';

class MyHomePageTest3 extends StatelessWidget {
  const MyHomePageTest3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test location'),
            FutureBuilder(
                future: ServiceLocator.locationRepository.getLocation(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<Coordinates> snapshot,
                ) {
                  if (snapshot.hasData) {
                    Logger.log(snapshot.data.toString());
                    return const Text('Loaded');
                  } else {
                    return const Text('loading...');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
