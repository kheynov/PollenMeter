import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';

class StateHolder extends StateNotifier<Map<String, List<DiaryModel>>> {
  StateHolder(super.state);

  void init(Map<String, List<DiaryModel>> map) {
    state = map;
  }

  void updateState(DiaryModel diaryModel) {
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(diaryModel.timestamp));
    final dateKey = DateFormat('yMd').format(dateTime);
    final stateNew = state;
    if (stateNew.containsKey(dateKey)) {
      stateNew[dateKey]!.add(diaryModel);
    } else {
      stateNew[dateKey] = [diaryModel];
    }
    state = stateNew;
  }

  List<DiaryModel> getListDiaryModel(DateTime dateTime) {
    return state[DateFormat('yMd').format(dateTime)] ?? [];
  }
}
