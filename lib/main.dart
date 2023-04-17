import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';
import 'package:pollen_meter/core/utils/di.dart';
import 'package:pollen_meter/routes.dart';
import 'package:pollen_meter/theme.dart';

import 'core/domain/ambee_api/models/pollen_model.dart';
import 'core/domain/gauge/auxiliary_gauge_logic.dart';
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

final pollenDataProvider = FutureProvider.family<PollenModel, Coordinates>(
  (ref, coords) async {
    return ServiceLocator.pollenRepository
        .fetchData(latitude: coords.latitude, longitude: coords.longitude);
  },
);

final profileDataProvider = FutureProvider(
  (ref) async {
    return ServiceLocator.profileDataRepository.getProfile();
  },
);

final auxiliaryGaugeLogicProvider =
    FutureProvider.family<AuxiliaryGaugeLogic, Coordinates>(
  (ref, coords) async {
    final pollenData = await ref.watch(pollenDataProvider(coords).future);
    final profileData = await ref.watch(profileDataProvider.future);
    return AuxiliaryGaugeLogic(
        profileData: profileData, pollenData: pollenData);
  },
);

final locationProvider = FutureProvider<Coordinates>((ref) async {
  return ServiceLocator.locationRepository.getLocation();
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
      supportedLocales: const [Locale('en'), Locale('ru')],
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
