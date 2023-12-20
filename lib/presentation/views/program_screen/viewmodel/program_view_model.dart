import 'dart:async';

import 'package:hiberus_university/domain/program_repository.dart';
import 'package:hiberus_university/models/program_screen/modulo.dart';
import 'package:hiberus_university/models/resource_state.dart';
import 'package:hiberus_university/presentation/base/base_view_model.dart';

class ProgramViewModel extends BaseViewModel{

  final ProgramRepository _programRepository;

  final StreamController<ResourceState<List<Modulo>>> getTopicsState = StreamController();

  ProgramViewModel({
    required ProgramRepository programRepository
  }) : _programRepository = programRepository;


  fetchTopics(){
    getTopicsState.add(ResourceState.loading());

    _programRepository.getTopics()
        .then((value) => getTopicsState.add(ResourceState.success(value)))
        .catchError((error) =>getTopicsState.add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    getTopicsState.close();
  }

}