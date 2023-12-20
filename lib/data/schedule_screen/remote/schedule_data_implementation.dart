import 'package:hiberus_university/data/schedule_screen/schedule_remote_implementation.dart';
import 'package:hiberus_university/domain/schedule_repository.dart';
import 'package:hiberus_university/models/schedule_screen/info_day.dart';

class ScheduleDataImplementation extends ScheduleRepository{

  final ScheduleRemoteImplementation _remoteImplementation;

  ScheduleDataImplementation({
    required ScheduleRemoteImplementation remoteImplementation
  }) : _remoteImplementation = remoteImplementation;

  @override
  Future<Map<DateTime, InfoDay>> getScheduleEvents() {
    return _remoteImplementation.getScheduleEvents();
  }
}