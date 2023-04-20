import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/domain/diary/enums/well_being_state.dart';
import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';
import 'package:pollen_meter/diary/presentation/widgets/calendar.dart';

import 'manager/di.dart';

class DiaryPage extends ConsumerStatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends ConsumerState<DiaryPage> {

  @override
  void initState() {
    ref.read(managerProvider).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final manager = ref.watch(managerProvider);
    manager.updateState(DiaryModel('', WellBeingState.good, DateTime.now().millisecondsSinceEpoch.toString()));
    final state = ref.watch(stateHolderProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CalendarWidget(
                getEventsForDay: (DateTime dataTime) {
                  return manager.getListDiaryModel(dataTime);
                },
                onSelectedDay: (DateTime dateTime) {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

