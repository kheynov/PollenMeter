import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';

abstract class ProfileService {
  Future<ProfileDataModel> getProfile();

  Future<bool> saveProfile(ProfileDataModel profile);
}
