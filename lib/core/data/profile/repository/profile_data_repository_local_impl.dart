import 'package:pollen_meter/core/data/profile/local/profile_local_data_source.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';

import '../../../domain/profile/repository/profile_data_repository.dart';

class ProfileDataRepositoryLocalImpl implements ProfileDataRepository {
  final ProfileLocalDataStore dataStore;

  ProfileDataRepositoryLocalImpl({required this.dataStore});

  @override
  Future<ProfileDataModel> getProfile() async {
    return await dataStore.getProfile();
  }

  @override
  Future<bool> saveProfile(ProfileDataModel profile) async {
    return await dataStore.saveProfile(profile);
  }
}
