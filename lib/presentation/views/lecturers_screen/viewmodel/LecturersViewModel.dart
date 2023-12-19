
import 'dart:async';

import 'package:hiberus_university/domain/lecturers_repository.dart';
import 'package:hiberus_university/models/instructors_screen/Instructor.dart';
import 'package:hiberus_university/models/resource_state.dart';
import 'package:hiberus_university/presentation/base/base_view_model.dart';

class LecturersViewModel extends BaseViewModel{

  final LecturersRepository _lecturersRepository;

  final StreamController<ResourceState<List<Instructor>>> getLecturersState = StreamController();

  LecturersViewModel({
    required LecturersRepository lecturersRepository
  }): _lecturersRepository = lecturersRepository;

  fetchLecturers(){
    getLecturersState.add(ResourceState.loading());

    _lecturersRepository.getLecturers()
        .then((value) => getLecturersState.add(ResourceState.success(value)))
        .catchError((error) =>getLecturersState.add(ResourceState.error(error)));
  }


  @override
  void dispose() {
    // TODO: implement dispose
    getLecturersState.close();
  }

}