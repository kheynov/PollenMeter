import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pollen_meter/core/domain/diary/enums/well_being_state.dart';
import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/diary/presentation/widgets/calendar.dart';

import 'manager/di.dart';

final listDiaryEntriesProvider = Provider((ref) => <DiaryModel>[]);

class DiaryPage extends ConsumerStatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends ConsumerState<DiaryPage> {
  List<DiaryModel> listSelectedDiary = [];

  @override
  void initState() {
    ref.read(managerProvider).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final manager = ref.watch(managerProvider);
    manager.updateState(DiaryModel('', WellBeingState.good, DateTime.now().millisecondsSinceEpoch.toString()));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                context.loc.diaryPage,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              CalendarWidget(
                getEventsForDay: (DateTime dataTime) {
                  return manager.getListDiaryModel(dataTime);
                },
                onSelectedDay: (DateTime dateTime) {
                  listSelectedDiary = manager.getListDiaryModel(dateTime);
                  ref.read(listDiaryEntriesProvider).clear();
                  ref.read(listDiaryEntriesProvider).addAll(listSelectedDiary);
                  print(listSelectedDiary);
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: SingleChildScrollView(
                  child: DiaryEntriesWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiaryEntryTileModel {
  final DiaryModel diaryModel;
  bool isExpansion = false;

  DiaryEntryTileModel(this.diaryModel);
}

class DiaryEntriesWidget extends ConsumerStatefulWidget {
  const DiaryEntriesWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<DiaryEntriesWidget> createState() => _DiaryEntriesWidgetState();
}

class _DiaryEntriesWidgetState extends ConsumerState<DiaryEntriesWidget> {
  late List<DiaryEntryTileModel> listDiaryEntry;
  late List<DiaryModel> listDiaryModel;

  @override
  void initState() {
    listDiaryModel = ref.read(listDiaryEntriesProvider);
    listDiaryEntry = listDiaryModel.map((el) => DiaryEntryTileModel(el)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DiaryModel> listDiaryModelNew = ref.watch(listDiaryEntriesProvider);
    print(listDiaryModel != listDiaryModelNew);
    if (listDiaryModel != listDiaryModelNew) {
      listDiaryEntry = listDiaryModel.map((el) => DiaryEntryTileModel(el)).toList();
      listDiaryModel = listDiaryModelNew;
      print("---$listDiaryModel");
    }
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 500),
      expansionCallback: (int index, bool isExpansion) {
        listDiaryEntry[index].isExpansion = !isExpansion;
        setState(() {});
      },
      children: listDiaryEntry
          .map((entry) => ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  print(isExpanded);

                  final dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(entry.diaryModel.timestamp));
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('jms').format(dateTime)),
                      Row(
                        children: [
                          Text(
                            context.loc.feelings,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(entry.diaryModel.state.emoji),
                        ],
                      ),
                    ],
                  );
                },
                body: Text('111'),
                // Column(
                //   children: [
                //     Text(context.loc.commentary),
                //     Text(entry.diaryModel.message),
                //   ],
                // ),
                isExpanded: entry.isExpansion,
              ))
          .toList(),
    );
  }
}
