import 'dart:async';

import 'package:hiberus_university/domain/schedule_repository.dart';
import 'package:hiberus_university/models/resource_state.dart';
import 'package:hiberus_university/models/schedule_screen/info_day.dart';
import 'package:hiberus_university/presentation/base/base_view_model.dart';

class ScheduleViewModel extends BaseViewModel{

  final ScheduleRepository _scheduleRepository;

  final StreamController<ResourceState<Map<DateTime, InfoDay>>> getScheduleState = StreamController();

  ScheduleViewModel({
    required ScheduleRepository scheduleRepository
  }) : _scheduleRepository = scheduleRepository;

  fetchSchedule(){
    getScheduleState.add(ResourceState.loading());

    _scheduleRepository.getScheduleEvents()
        .then((value) => getScheduleState.add(ResourceState.success(value.cast<DateTime, InfoDay>())))
        .catchError((error) => getScheduleState.add(ResourceState.error(error)));
  }


  @override
  void dispose() {
    // TODO: implement dispose
    getScheduleState.close();
  }

}