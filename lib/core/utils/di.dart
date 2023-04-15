import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pollen_meter/core/data/ambee_api/ambee_api.dart';
import 'package:pollen_meter/core/data/profile/local/profile_local_data_source.dart';
import 'package:pollen_meter/core/data/profile/repository/profile_data_repository_local_impl.dart';
import 'package:pollen_meter/core/domain/ambee_api/repository/pollen_repository.dart';
import 'package:pollen_meter/core/domain/profile/repository/profile_data_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/ambee_api/repository/pollen_repository_api_impl.dart';
import 'logger.dart';

class ServiceLocator {
  const ServiceLocator._();

  static final GetIt _locator = GetIt.instance;

  static initApp() async {
    /// Register dependencies
    Logger.log('Dependencies initializing...');

    _locator.registerFactoryAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());

    _locator.registerLazySingleton<ProfileLocalDataStore>(() =>
        ProfileLocalDataStore(
            sharedPreferences: _locator<SharedPreferences>()));

    _locator.registerLazySingleton<Dio>(() => Dio());

    _locator.registerLazySingleton<AmbeeClient>(
        () => AmbeeClient(dio: _locator<Dio>()));

    _locator.registerLazySingleton<ProfileDataRepository>(() =>
        ProfileDataRepositoryLocalImpl(
            dataStore: _locator<ProfileLocalDataStore>()));

    _locator.registerLazySingleton<PollenRepository>(
        () => PollenRepositoryApiImpl(ambeeClient: _locator<AmbeeClient>()));

    Logger.log('Dependencies initialized!');
  }

  static void dispose() {
    _locator.reset(dispose: true);
  }

  static PollenRepository get pollenRepository => _locator<PollenRepository>();

  static ProfileDataRepository get profileDataRepository =>
      _locator<ProfileDataRepository>();
}
