import 'package:firebase_auth/firebase_auth.dart';
import 'package:pollen_meter/core/data/profile/local/profile_local_data_source.dart';
import 'package:pollen_meter/core/data/profile/remote/firebase_profile_service.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';

import '../../domain/profile/repository/profile_data_repository.dart';

class ProfileServiceImpl implements ProfileService {
  final ProfileLocalDataStore localRepository;
  final FirebaseProfileDataStore remoteRepository; // TODO: refactor

  final FirebaseAuth auth = FirebaseAuth.instance;

  ProfileServiceImpl(this.localRepository, this.remoteRepository);

  @override
  Future<void> syncFromRemoteRepository() async {
    assert(auth.currentUser != null);
    await remoteRepository
        .getProfile(auth.currentUser!.uid)
        .then((value) => localRepository.saveProfile(value));
  }

  @override
  Future<void> syncToRemoteRepository() async {
    assert(auth.currentUser != null);
    await localRepository.getProfile().then((profile) =>
        remoteRepository.saveProfile(
            profile ?? const ProfileDataModel(ThemeTypes.system, []),
            auth.currentUser!.uid));
  }

  @override
  Future<ProfileDataModel> getProfile() async {
    if (auth.currentUser != null) {
      try {
        final profile =
            await remoteRepository.getProfile(auth.currentUser!.uid);
        await localRepository.saveProfile(profile);
      } catch (e) {
        await remoteRepository.createUser(await localRepository.getProfile() ??
            const ProfileDataModel(ThemeTypes.system, []));
      }
    }
    return await localRepository.getProfile() ??
        const ProfileDataModel(ThemeTypes.system, []);
  }

  @override
  Future<void> saveProfile(ProfileDataModel profile) async {
    await localRepository.saveProfile(profile);
    if (auth.currentUser != null) {
      await remoteRepository.saveProfile(profile, auth.currentUser!.uid);
    }
  }
}
