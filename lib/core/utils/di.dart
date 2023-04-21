import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pollen_meter/core/data/ambee_api/ambee_api.dart';
import 'package:pollen_meter/core/data/profile/local/profile_local_data_source.dart';
import 'package:pollen_meter/core/data/profile/profile_service.dart';
import 'package:pollen_meter/core/data/profile/remote/firebase_profile_service.dart';
import 'package:pollen_meter/core/domain/ambee_api/repository/pollen_repository.dart';
import 'package:pollen_meter/core/domain/ambee_api/use_cases/fetch_data_from_ambee_use_case.dart';
import 'package:pollen_meter/core/domain/profile/repository/profile_data_repository.dart';
import 'package:pollen_meter/dashboard/data/location_repository_impl.dart';
import 'package:pollen_meter/dashboard/domain/location_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/ambee_api/repository/pollen_repository_api_impl.dart';

import 'logger.dart';

class ServiceLocator {
  const ServiceLocator._();

  static final GetIt _locator = GetIt.instance;

  static initApp() async {
    /// Register dependencies
    Logger.log('Dependencies initializing...');

    _locator.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());

    _locator.registerLazySingleton(() => FirebaseProfileDataStore());

    _locator.registerLazySingleton<ProfileLocalDataStore>(() =>
        ProfileLocalDataStore(
            sharedPreferences: _locator<SharedPreferences>()));

    _locator.registerLazySingleton<Dio>(() => Dio());

    _locator.registerLazySingleton<AmbeeClient>(
        () => AmbeeClient(dio: _locator<Dio>()));

    _locator.registerLazySingleton<PollenRepository>(
        () => PollenRepositoryApiImpl(ambeeClient: _locator<AmbeeClient>()));

    _locator.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl());

    _locator.registerLazySingleton<FetchDataFromAmbeeUseCase>(
      () => FetchDataFromAmbeeUseCase(
          pollenRepository: _locator<PollenRepository>(),
          preferences: _locator<SharedPreferences>()),
    );

    _locator.registerLazySingleton<ProfileService>(() => ProfileServiceImpl(
        _locator<ProfileLocalDataStore>(),
        _locator<FirebaseProfileDataStore>()));

    await GetIt.instance.allReady();
    Logger.log('Dependencies initialized!');
  }

  static void dispose() {
    _locator.reset(dispose: true);
  }

  static FetchDataFromAmbeeUseCase get fetchDataFromAmbeeUseCase =>
      _locator<FetchDataFromAmbeeUseCase>();

  static FirebaseProfileDataStore get firebaseService =>
      _locator<FirebaseProfileDataStore>();

  static LocationRepository get locationRepository =>
      _locator<LocationRepository>();

  static ProfileService get profileService => _locator<ProfileService>();

  static SharedPreferences get sharedPreferences =>
      _locator<SharedPreferences>();
}
