import 'dart:convert';

import 'package:pollen_meter/core/domain/ambee_api/models/pollen_model.dart';
import 'package:pollen_meter/core/domain/ambee_api/repository/pollen_repository.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_data_from_ambee_use_case.g.dart';

class FetchDataFromAmbeeUseCase {
  final PollenRepository _pollenRepository;

  final SharedPreferences _preferences;

  FetchDataFromAmbeeUseCase(
      {required PollenRepository pollenRepository,
      required SharedPreferences preferences})
      : _preferences = preferences,
        _pollenRepository = pollenRepository;

  Future<PollenModel> call({required Coordinates coordinates}) async {
    final savedData = _preferences.getString('api_cache');
    if (savedData != null && savedData.isNotEmpty) {
      final cache = AmbeeApiCacheDto.fromJson(jsonDecode(savedData));
      if (cache.coordinates.getDistance(coordinates) < 1.0 &&
          DateTime.now().difference(cache.timestamp).inMinutes < 60) {
        return cache.data;
      }
    }

    final data = await _pollenRepository.fetchData(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude,
    );
    _preferences.setString('api_cache',
        jsonEncode(AmbeeApiCacheDto(coordinates, DateTime.now(), data)));
    return data;
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AmbeeApiCacheDto {
  final Coordinates coordinates;
  final DateTime timestamp;
  final PollenModel data;

  AmbeeApiCacheDto(this.coordinates, this.timestamp, this.data);

  Map<String, dynamic> toJson() => _$AmbeeApiCacheDtoToJson(this);

  factory AmbeeApiCacheDto.fromJson(Map<String, dynamic> json) =>
      _$AmbeeApiCacheDtoFromJson(json);
}
