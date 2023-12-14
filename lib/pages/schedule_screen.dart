import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>{

  DateTime _focusedDay = DateTime.utc(2023, 12, 6);
  DateTime? _selectedDay;
  Map<DateTime, InfoDay> events = {
    DateTime(2023, 9, 4): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 5): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 6): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 7): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 11): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 12): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 13): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 14): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 18): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 19): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 20): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 21): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 25): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 26): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 9, 27): InfoDay(WorkdayStatus.workday, [Event("Vencimiento de RECIBI MATERIAL")]),
    DateTime(2023, 9, 28): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 2): InfoDay(WorkdayStatus.workday, [Event("Vencimiento de propuesta para el Proyecto Final")]),
    DateTime(2023, 10, 3): InfoDay(WorkdayStatus.workday, [Event("Prueba Intermedia")]),
    DateTime(2023, 10, 4): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 5): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 9): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 10): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 11): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 12): InfoDay(WorkdayStatus.holiday, []),
    DateTime(2023, 10, 16): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 17): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 18): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 19): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 23): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 24): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 25): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 26): InfoDay(WorkdayStatus.workday, [Event("Examen Final")]),
    DateTime(2023, 10, 30): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 10, 31): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 1): InfoDay(WorkdayStatus.holiday, []),
    DateTime(2023, 11, 2): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 6): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 7): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 8): InfoDay(WorkdayStatus.workday, [Event("Examen Intermedio")]),
    DateTime(2023, 11, 9): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 13): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 14): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 15): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 16): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 17): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 20): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 21): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 22): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 23): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 27): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 28): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 29): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 11, 30): InfoDay(WorkdayStatus.workday, [Event("Vencimiento de RECIBI MATERIAL")]),
    DateTime(2023, 12, 4): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 12, 5): InfoDay(WorkdayStatus.workday, [Event("Vencimiento de propuesta de Proyecto Final"), Event("Se abre Examen Final"),]),
    DateTime(2023, 12, 6): InfoDay(WorkdayStatus.holiday, []),
    DateTime(2023, 12, 7): InfoDay(WorkdayStatus.holiday, []),
    DateTime(2023, 12, 8): InfoDay(WorkdayStatus.holiday, []),

    DateTime(2023, 12, 11): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 12, 12): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 12, 13): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 12, 14): InfoDay(WorkdayStatus.workday, []),

    DateTime(2023, 12, 18): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 12, 19): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 12, 20): InfoDay(WorkdayStatus.workday, []),
    DateTime(2023, 12, 21): InfoDay(WorkdayStatus.workday, []),

    DateTime(2023, 12, 25): InfoDay(WorkdayStatus.holiday, []),
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
    return events[DateTime(day.year, day.month, day.day)]?.listEvents ?? [];
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
      body: SafeArea(
        child: Column(
          children: [

            Text(
              "CALENDARIO",
              style: ConstantsApp.TittleApp
            ),

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

              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, _){
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                    color: Colors.grey,
                    width: 100,
                    height: 100,
                    child: Text(
                      "${date.day}",
                      style: TextStyle().copyWith(fontSize: 16.0),
                    ),
                  );
                },


                todayBuilder: (context, date, _){
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                    color: Color(0xFF133963),
                    width: 100,
                    height: 100,
                    child: Text(
                      "${date.day}",
                      style: TextStyle().copyWith(fontSize: 16.0, color: Colors.white),
                    ),
                  );
                },

                prioritizedBuilder: (context, date, _){

                  //if(events.containsKey(DateTime(date.year, date.month, date.day))){
                  if(events[DateTime(date.year, date.month, date.day)]?.workdayStatus == WorkdayStatus.holiday){
                    return HolyDayCalendar(date: date,);
                  }else if(events[DateTime(date.year, date.month, date.day)]?.workdayStatus == WorkdayStatus.workday){
                    return WorkDayCalendar(date: date,);
                  }
                }


              ),

            ),
            const SizedBox(
              height: 8.0,
            ),

            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _){
                    return Column(
                      children: [

                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF133963),
                            border: Border.all()
                          ),
                          child:Text("${DateFormat('EEEE', 'es').format(_selectedDay!)}, ${_selectedDay!.day} ${DateFormat('MMMM', 'es').format(_selectedDay!)} eventos",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Expanded(
                          child: ListView.builder(
                            itemCount: value.length,
                              itemBuilder: (context, index){
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                  ),
                                  child: Column(
                                    children: [

                          
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                          
                                            const Icon(
                                                FontAwesomeIcons.calendarCheck,
                                            color: Color(0xFF133963),
                                            ),
                          
                                            const SizedBox(width: 20,),
                          
                                            Expanded(
                                              child:  Text(value[index].title, style: const TextStyle(
                                                fontSize: 18
                                              ),),
                                            ),
                                          ],
                                        ),
                                      ),
                          
                                    ],
                                  )
                                );
                              }
                          ),
                        ),
                      ],
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



class HolyDayCalendar extends StatelessWidget {
  const HolyDayCalendar({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: Colors.red,
          border: Border.all(
              color: Colors.black,
              width: 2.0
          )
      ),
      child: Center(
        child: Text(
          "${date.day}",
          style: TextStyle().copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}

class WorkDayCalendar extends StatelessWidget {
  const WorkDayCalendar({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: Colors.amberAccent,
        border: Border.all(
          color: Colors.black,
          width: 2.0
        )
      ),
      child: Center(
        child: Text(
          "${date.day}",
          style: TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

enum WorkdayStatus {
  holiday,
  workday,
}

class InfoDay{
  final WorkdayStatus workdayStatus;
  final List<Event> listEvents;

  InfoDay(this.workdayStatus, this.listEvents);

}

class Event{
  final String title;

  Event(this.title);
}
