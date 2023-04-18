import 'package:flutter/material.dart';
import '../ambee_api/models/pollen_model.dart';
import '../profile/model/profile_data_model.dart';

class PollenUILogic extends ChangeNotifier {
  final PollenModel pollenData;
  final ProfileDataModel profileData;
  PollenUILogic({required this.pollenData, required this.profileData});
}
