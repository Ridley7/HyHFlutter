import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiberus_university/di/app_modules.dart';
import 'package:hiberus_university/presentation/constants/constants_app.dart';
import 'package:hiberus_university/presentation/constants/strings_app.dart';
import 'package:hiberus_university/presentation/model/resource_state.dart';
import 'package:hiberus_university/models/schedule_screen/event.dart';
import 'package:hiberus_university/models/schedule_screen/info_day.dart';
import 'package:hiberus_university/models/schedule_screen/workday_status.dart';
import 'package:hiberus_university/presentation/views/schedule_screen/viewmodel/schedule_viewmodel.dart';
import 'package:hiberus_university/presentation/widgets/commons/error_view.dart';
import 'package:hiberus_university/presentation/widgets/commons/loading_view.dart';
import 'package:hiberus_university/presentation/widgets/schedule_screen/holy_day_calendar.dart';
import 'package:hiberus_university/presentation/widgets/schedule_screen/work_day_calendar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _focusedDay = DateTime.utc(2023, 12, 6);
  DateTime? _selectedDay;

  late final ValueNotifier<List<Event>> _selectedEvents;

  final ScheduleViewModel _scheduleViewModel = inject<ScheduleViewModel>();
  Map<DateTime, InfoDay> events = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scheduleViewModel.getScheduleState.stream.listen((state) {
      switch(state.status){

        case Status.LOADING:
          LoadingView.show(context);
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          setState(() {
            events.addAll(state.data!.cast<DateTime, InfoDay>());
          });
          break;
        case Status.ERROR:
          LoadingView.hide();
          ErrorView.show(context, state.exception!.toString(), (){
            _scheduleViewModel.fetchSchedule();
          });
          break;
      }
    });

    _scheduleViewModel.fetchSchedule();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(StringsApp.CALENDARIO, style: ConstantsApp.TittleApp),
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2023, 9, 1),
              lastDay: DateTime.utc(2024, 1, 30),
              locale: "es_ES",
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: _onDaySelected,
              eventLoader: _getEventsForDay,
              calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  weekendTextStyle: ConstantsApp.CalendarStyle,
                  holidayTextStyle: ConstantsApp.CalendarStyle),
              headerStyle: const HeaderStyle(
                  titleCentered: true, formatButtonVisible: false),
              calendarBuilders:
                  CalendarBuilders(selectedBuilder: (context, date, _) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                  color: Colors.grey,
                  width: 100,
                  height: 100,
                  child: Text(
                    "${date.day}",
                    style: const TextStyle().copyWith(fontSize: 16.0),
                  ),
                );
              }, todayBuilder: (context, date, _) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                  color: ConstantsApp.BlueHiberusDark,
                  width: 100,
                  height: 100,
                  child: Text(
                    "${date.day}",
                    style: const TextStyle()
                        .copyWith(fontSize: 16.0, color: Colors.white),
                  ),
                );
              }, prioritizedBuilder: (context, date, _) {
                if (events[DateTime(date.year, date.month, date.day)]
                        ?.workdayStatus ==
                    WorkdayStatus.holiday) {
                  return HolyDayCalendar(
                    date: date,
                  );
                } else if (events[DateTime(date.year, date.month, date.day)]
                        ?.workdayStatus ==
                    WorkdayStatus.workday) {
                  return WorkDayCalendar(
                    date: date,
                  );
                }
              }),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ConstantsApp.BlueHiberusDark,
                              border: Border.all()),
                          child: Text(
                            "${DateFormat('EEEE', 'es').format(_selectedDay!)}, ${_selectedDay!.day} ${DateFormat('MMMM', 'es').format(_selectedDay!)} eventos",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: value.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
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
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  value[index].title,
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
                              }),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[DateTime(day.year, day.month, day.day)]?.listEvents ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }
}
