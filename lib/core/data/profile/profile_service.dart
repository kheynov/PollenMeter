import 'package:firebase_auth/firebase_auth.dart';
import 'package:pollen_meter/core/data/profile/local/data_source/profile_local_data_source.dart';
import 'package:pollen_meter/core/data/profile/remote/firebase_profile_service.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';

class ProfileService {
  final ProfileLocalDataStore localRepository;
  final FirebaseProfileService remoteRepository;

  final FirebaseAuth auth = FirebaseAuth.instance;

  ProfileService(this.localRepository, this.remoteRepository);

  Future<void> syncFromRemoteRepository() async {
    assert(auth.currentUser != null);
    await localRepository.getProfile().then(
        (value) => remoteRepository.saveProfile(value, auth.currentUser!.uid));
  }

  Future<void> syncToRemoteRepository() async {
    assert(auth.currentUser != null);
    await localRepository.getProfile().then((profile) =>
        remoteRepository.saveProfile(profile, auth.currentUser!.uid));
  }

  Future<ProfileDataModel> getProfile() async {
    return await localRepository.getProfile();
  }

  Future<void> saveProfile(ProfileDataModel profile) async {
    await localRepository.saveProfile(profile);
    if (auth.currentUser != null) {
      await remoteRepository.saveProfile(profile, auth.currentUser!.uid);
    }
  }
}
