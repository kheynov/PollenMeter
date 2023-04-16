import 'package:flutter/material.dart';
import '../ambee_api/models/pollen_model.dart';
import '../profile/model/profile_data_model.dart';

class AuxiliaryGaugeLogic extends ChangeNotifier {
  final PollenModel pollenData;
  final ProfileDataModel profileData;
  AuxiliaryGaugeLogic({required this.pollenData, required this.profileData});
}
