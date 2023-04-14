import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';

abstract class ProfileDataRepository {
  Future<ProfileDataModel> getProfile();

  Future<void> saveProfile(ProfileDataModel profile);
}