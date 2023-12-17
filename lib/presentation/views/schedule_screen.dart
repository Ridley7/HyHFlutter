
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/constants/strings_app.dart';
import 'package:hiberus_university/raw_data/raw_data.dart';
import 'package:hiberus_university/widgets/schedule/holy_day_calendar.dart';
import 'package:hiberus_university/widgets/schedule/work_day_calendar.dart';
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
              StringsApp.CALENDARIO,
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
