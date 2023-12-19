import 'package:hiberus_university/models/schedule_screen/info_day.dart';

abstract class ScheduleRepository{
  Future<Map<DateTime, InfoDay>> getScheduleEvents();
}