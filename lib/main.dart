import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/data/ambee_api/repository/pollen_repository_api_impl.dart';

import 'package:pollen_meter/routes.dart';
import 'package:pollen_meter/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/data/ambee_api/ambee_api.dart';
import 'core/domain/ambee_api/models/pollen_model.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
  initializeFirebase();
}

void initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

final dioService = DioClient();

final pollenDataProvider =
    FutureProvider.family<PollenModel, int>((ref, coords) async {
  return PollenRepositoryApiImpl(dioService)
      .fetchData(latitude: coords, longitude: coords);
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pollen meter',
      theme: brightTheme,
      routerConfig: RouteGenerator().router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
