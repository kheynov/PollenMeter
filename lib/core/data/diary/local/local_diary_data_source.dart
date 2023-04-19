import 'dart:convert';

import 'package:pollen_meter/core/data/diary/local/dto/local_diary_dto.dart';
import 'package:pollen_meter/core/domain/diary/repository/diary_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/diary/models/diary_model.dart';

class LocalDiaryDataStore implements DiaryDataStore {
  final SharedPreferences sharedPreferences;

  LocalDiaryDataStore(this.sharedPreferences);

  @override
  Future<List<DiaryModel>> getDiaries() {
    final String? diaryJson = sharedPreferences.getString('diary');
    if (diaryJson != null) {
      return Future.value(LocalDiaryDto.fromJson(jsonDecode(diaryJson)).data);
    } else {
      throw Exception('No diary found');
    }
  }

  @override
  Future<void> saveDiary(DiaryModel diary) {
    final String? diaryJson = sharedPreferences.getString('diary');
    if (diaryJson != null) {
      final LocalDiaryDto localDiaryDto =
          LocalDiaryDto.fromJson(jsonDecode(diaryJson));
      localDiaryDto.data.add(diary);
      return sharedPreferences.setString(
        'diary',
        jsonEncode(localDiaryDto.toJson()),
      );
    }
    return sharedPreferences.setString(
      'diary',
      jsonEncode(LocalDiaryDto([diary]).toJson()),
    );
  }
}
