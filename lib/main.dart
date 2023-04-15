import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';
import 'package:pollen_meter/core/utils/di.dart';
import 'package:pollen_meter/routes.dart';
import 'package:pollen_meter/theme.dart';

import 'core/data/ambee_api/ambee_api.dart';
import 'core/data/ambee_api/repository/pollen_repository_api_impl.dart';
import 'core/domain/ambee_api/models/pollen_model.dart';
import 'firebase_options.dart';

void main() async {
  initializeFirebase();
  await ServiceLocator.initApp();
  runApp(const ProviderScope(child: MyApp()));
}

void initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

final dio = Dio();
final dioService = AmbeeClient(dio: dio);
final pollenDataProvider =
    FutureProvider.family<PollenModel, Coordinates>((ref, coords) async {
  return PollenRepositoryApiImpl(ambeeClient: dioService)
      .fetchData(latitude: coords.latitude, longitude: coords.longitude);
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
