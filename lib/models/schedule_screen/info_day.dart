import 'package:hiberus_university/models/schedule_screen/event.dart';
import 'package:hiberus_university/models/schedule_screen/workday_status.dart';

class InfoDay{
  final WorkdayStatus workdayStatus;
  final List<Event> listEvents;

  InfoDay(this.workdayStatus, this.listEvents);

}