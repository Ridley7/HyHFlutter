import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>{

  DateTime _focusedDay = DateTime.utc(2023, 12, 6);
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {
    DateTime(2023, 12, 6): [Event("hola"), Event("que tal")],
    DateTime(2023, 12, 7): [Event("reunion"), Event("comida")],
  };
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<Event> _getEventsForDay(DateTime day){
    return events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if(!isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendar"),),
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2023, 9, 1),
                lastDay: DateTime.utc(2024, 1, 30),
              locale: "es_ES",
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: (day){
                  return isSameDay(_selectedDay, day);
              },
              onDaySelected: _onDaySelected,
              eventLoader: _getEventsForDay,
              calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  weekendTextStyle: TextStyle().copyWith(color: Colors.blue[800]),
                  holidayTextStyle: TextStyle().copyWith(color: Colors.blue[800])
              ),

              headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false
              ),


            ),
            const SizedBox(
              height: 8.0,
            ),

            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _){
                    return ListView.builder(
                      itemCount: value.length,
                        itemBuilder: (context, index){
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              onTap: () => print(""),
                              title: Text("${value[index].title}"),
                            ),
                          );
                        }
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }


}


class Event{
  final String title;
  Event(this.title);
}

class CalendarOne extends StatelessWidget {
  const CalendarOne({
    super.key,
    required AnimationController animationController,
  }) : _animationController = animationController;

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2023, 9, 1),
            lastDay: DateTime.utc(2023, 12, 31),
          locale:'es_ES',
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableCalendarFormats: const {
              CalendarFormat.month: ""
          },

          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            weekendTextStyle: TextStyle().copyWith(color: Colors.blue[800]),
            holidayTextStyle: TextStyle().copyWith(color: Colors.blue[800])
          ),

          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: TextStyle().copyWith(color: Colors.blue[600])
          ),

          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false
          ),


          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, date, _){
              return FadeTransition(
                  opacity: Tween(
                    begin: 0.0,
                    end: 1.0
                  ).animate(_animationController),
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                  color: Colors.deepOrange[300],
                  width: 100,
                  height: 100,
                  child: Text(
                    "${date.day}",
                    style: TextStyle().copyWith(fontSize: 16.0),
                  ),
                ),
              );
            },


            todayBuilder: (context, date, _){
              return Container(
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                color: Colors.amber[400],
                width: 100,
                height: 100,
                child: Text(
                  "${date.day}",
                  style: TextStyle().copyWith(fontSize: 16.0),
                ),
              );
            },


          ),

          onDaySelected: (date, events){
              print("Callback: _ondaySelected");
              _animationController.forward(from: 0.0);
          },


        )
      ],
    );
  }
}
