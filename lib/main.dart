import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';
import 'package:pollen_meter/core/utils/di.dart';
import 'package:pollen_meter/profile/domain/logic/profile_logic.dart';
import 'package:pollen_meter/routes.dart';
import 'package:pollen_meter/theme.dart';
import 'core/domain/ambee_api/models/pollen_model.dart';
import 'core/domain/gauge/pollen_ui_logic.dart';
import 'core/domain/profile/model/profile_data_model.dart';
import 'firebase_options.dart';

void main() async {
  initializeFirebase();
  await ServiceLocator.initApp();
  await Future.delayed(const Duration(seconds: 5));
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
    return ServiceLocator.fetchDataFromAmbeeUseCase(coordinates: coords);
  },
);

final profileServiceProvider = Provider(
  (ref) {
    return ServiceLocator.profileService;
  },
);

final profileLogicProvider =
    StateNotifierProvider<ProfileNotifier, ProfileDataModel>(
  (ref) {
    return ProfileNotifier(ref.watch(profileServiceProvider));
  },
);

final pollenUILogicProvider = FutureProvider<PollenUILogic>(
  (ref) async {
    final locationData = await ref.watch(locationProvider.future);
    final pollenData = await ref.watch(pollenDataProvider(locationData).future);
    final profileData = ref.watch(profileLogicProvider);
    return PollenUILogic(profileData: profileData, pollenData: pollenData);
  },
);

final locationProvider = FutureProvider<Coordinates>((ref) async {
  return ServiceLocator.locationRepository.getLocation();
});

//Это чтобы роутер не пересоздавался при замене темы.
final routerProvider = Provider(
  (ref) {
    return RouteGenerator().router;
  },
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileLogic = ref.watch(profileLogicProvider);
    late final ThemeMode themeMode;
    switch (profileLogic.theme) {
      case ThemeTypes.system:
        themeMode = ThemeMode.system;
        break;
      case ThemeTypes.light:
        themeMode = ThemeMode.light;
        break;
      case ThemeTypes.dark:
        themeMode = ThemeMode.dark;
        break;
    }
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Pollen meter',
      theme: brightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: router,
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
