import 'package:hiberus_university/models/schedule_screen/event.dart';
import 'package:hiberus_university/models/schedule_screen/workday_status.dart';

class InfoDay{
  final WorkdayStatus workdayStatus;
  final List<Event>? listEvents;

  InfoDay({
    required this.workdayStatus,
    required this.listEvents
  });

  factory InfoDay.fromJson(Map<String, dynamic> json) {

    return InfoDay(
      listEvents: json["events"] == null ? [] : List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      workdayStatus: _getWorkdayValue(json["status"]),
    );
  }

  static WorkdayStatus _getWorkdayValue(String workdayTarget) {
    for (WorkdayStatus workday in WorkdayStatus.values) {
      if (workday.value == workdayTarget) {
        return workday;
      }
    }
    throw Exception("Valor no válido para Workday: $workdayTarget");
  }



}