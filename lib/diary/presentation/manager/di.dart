import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/data/diary/diary_service.dart';
import 'package:pollen_meter/core/data/diary/local/local_diary_data_source.dart';
import 'package:pollen_meter/core/data/diary/remote/firebase_diary_data_source.dart';
import 'package:pollen_meter/core/utils/di.dart';
import 'package:pollen_meter/diary/presentation/manager/manager.dart';
import 'package:pollen_meter/diary/presentation/manager/state_holder.dart';

final diaryServiceProvider2 = Provider((ref) => DiaryService(
      ServiceLocator.locator<LocalDiaryDataStore>.call(),
      ServiceLocator.locator<FirebaseDiaryDataStore>.call(),
    ));

final managerProvider = Provider(
  (ref) => Manager(ref.watch(stateHolderProvider.notifier), ref),
);

final stateHolderProvider = StateNotifierProvider((ref) => StateHolder({}));
