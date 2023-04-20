import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pollen_meter/main.dart';
import 'emotion_picker.dart';
import 'feedback.dart';

class RecordPage extends ConsumerWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WellBeingState _wellBeingState = WellBeingState.dead;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 24, top: 32, bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                          const SizedBox(width: 10),
                          Text(DateFormat('MMMMd').format(DateTime.now()),
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      child: EmotionPickerWidget(
                        onChoice: (wellBeingState) {
                          // _wellBeingState = wellBeingState;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      child: FeedbackWidget(
                        themeType: [ref.watch(profileLogicProvider).theme],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
