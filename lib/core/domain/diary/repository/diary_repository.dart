import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';

abstract class DiaryDataStore {
  Future<void> saveDiary(DiaryModel diary);

  Future<List<DiaryModel>> getDiaries();
}
