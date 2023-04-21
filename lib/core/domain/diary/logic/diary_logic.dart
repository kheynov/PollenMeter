import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/diary/diary_service.dart';
import '../enums/well_being_state.dart';
import '../models/diary_model.dart';

class DiaryNotifier extends StateNotifier<List<DiaryModel>> {
  final DiaryService diaryService;
  DiaryNotifier(this.diaryService) : super(List<DiaryModel>.empty()) {
    diaryService.getDiaries().then((value) => state = value);
  }

  void addDiary(String message, WellBeingState newWellBeingState, String stamp) {
    state = [
      ...state,
      DiaryModel(message, newWellBeingState,
          stamp)
    ];
    diaryService.saveDiary(state.last);
  }
}
