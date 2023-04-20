import 'dart:convert';

import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDataStore {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataStore({required this.sharedPreferences});

  Future<ProfileDataModel?> getProfile() async {
    final String? profileJson = sharedPreferences.getString('profile');
    if (profileJson != null) {
      return ProfileDataModel.fromJson(json.decode(profileJson));
    } else {
      return null;
    }
  }

  Future<bool> saveProfile(ProfileDataModel profile) async {
    return await sharedPreferences.setString(
      'profile',
      jsonEncode(profile.toJson()),
    );
  }
}
