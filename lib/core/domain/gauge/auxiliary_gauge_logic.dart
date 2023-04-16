import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../ambee_api/models/pollen_model.dart';
import '../profile/model/profile_data_model.dart';

class AuxiliaryGaugeLogic extends ChangeNotifier {
  final AsyncValue<PollenModel> pollenData;
  final AsyncValue<ProfileDataModel> profileData;
  AuxiliaryGaugeLogic({required this.pollenData, required this.profileData});
}
