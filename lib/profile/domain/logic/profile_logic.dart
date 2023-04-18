import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/domain/profile/repository/profile_data_repository.dart';

import '../../../core/domain/profile/enums/allergen.dart';
import '../../../core/domain/profile/model/profile_data_model.dart';

class ProfileNotifier extends StateNotifier<ProfileDataModel> {
  final ProfileService profileService;
  ProfileNotifier(this.profileService)
      : super(const ProfileDataModel(ThemeTypes.system, [])) {
    profileService.getProfile().then((value) => state = value);
  }
  void toggleAllergen(Allergen allergen) {
    state = state.copyWith(
        allergens: state.allergens.contains(allergen)
            ? state.allergens.where((element) => element != allergen).toList()
            : [...state.allergens, allergen]);
    profileService.saveProfile(state);
  }
}
