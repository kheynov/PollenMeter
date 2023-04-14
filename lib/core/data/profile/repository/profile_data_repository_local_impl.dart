import 'package:pollen_meter/core/data/profile/local/profile_local_data_source.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';

import '../../../domain/profile/repository/profile_data_repository.dart';

class ProfileDataRepositoryLocalImpl implements ProfileDataRepository {
  final ProfileLocalDataStore profileLocalDataSource;

  ProfileDataRepositoryLocalImpl({required this.profileLocalDataSource});

  @override
  Future<ProfileDataModel> getProfile() async {
    return await profileLocalDataSource.getProfile();
  }

  @override
  Future<void> saveProfile(ProfileDataModel profile) async {
    return await profileLocalDataSource.saveProfile(profile);
  }
}
