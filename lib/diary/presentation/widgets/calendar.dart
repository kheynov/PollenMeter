import 'package:flutter/material.dart';
import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    Key? key,
    required this.getEventsForDay,
    required this.onSelectedDay,
  }) : super(key: key);

  final List<DiaryModel> Function(DateTime dataTime) getEventsForDay;
  final void Function(DateTime dateTime) onSelectedDay;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      availableCalendarFormats: {
        CalendarFormat.month: context.loc.month,
        CalendarFormat.twoWeeks: context.loc.twoWeeks,
        CalendarFormat.week: context.loc.week,
      },
      eventLoader: widget.getEventsForDay,
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary,
        ),
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        todayTextStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            widget.onSelectedDay(selectedDay);
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }
}
