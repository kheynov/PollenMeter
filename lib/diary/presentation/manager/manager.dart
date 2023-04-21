import 'package:collection/collection.dart' show groupBy;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';
import 'package:pollen_meter/diary/presentation/manager/state_holder.dart';

import 'di.dart';

class Manager {
  final StateHolder stateHolder;
  final Ref ref;

  Manager(this.stateHolder, this.ref);

  void init() async {
    List<DiaryModel> listDiaryModel =
        await ref.watch(diaryServiceProvider).getDiaries();
    groupBy(
      listDiaryModel,
      (dairy) {
        final dateTime =
            DateTime.fromMillisecondsSinceEpoch(int.parse(dairy.timestamp));
        // print(dateTime);
        return DateFormat('yMd').format(dateTime);
      },
    );
    // print('---------');
  }

  void updateState(DiaryModel diaryModel) {
    stateHolder.updateState(diaryModel);
    ref.read(diaryServiceProvider).saveDiary(diaryModel);
  }

  List<DiaryModel> getListDiaryModel(DateTime dateTime) {
    return stateHolder.getListDiaryModel(dateTime);
  }
}
