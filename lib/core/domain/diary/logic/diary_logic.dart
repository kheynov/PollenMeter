import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/diary/diary_service.dart';
import '../enums/well_being_state.dart';
import '../models/diary_model.dart';

class DiaryNotifier extends StateNotifier<List<DiaryModel>> {
  final DiaryService diaryService;
  DiaryNotifier(this.diaryService) : super(List<DiaryModel>.empty()) {
    diaryService.getDiaries().then((value) => state = value);
  }

  void addDiary(String message, WellBeingState newWellBeingState) {
    state = [
      ...state,
      DiaryModel(message, newWellBeingState,
          DateTime.now().millisecondsSinceEpoch.toString())
    ];
    diaryService.saveDiary(state.last);
  }
}
