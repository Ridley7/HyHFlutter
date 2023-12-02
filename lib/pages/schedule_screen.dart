import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2023, 09, 04),
                lastDay: DateTime.utc(2023, 12, 22),
              locale:'es_ES',
              //calendarFormat: CalendarFormat.week
            )
          ],
        ),
      ),
    );
  }
}
