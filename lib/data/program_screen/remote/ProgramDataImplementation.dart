import 'package:hiberus_university/data/program_screen/program_remote_implementation.dart';
import 'package:hiberus_university/domain/program_repository.dart';
import 'package:hiberus_university/models/program_screen/modulo.dart';

class ProgramDataImplementation extends ProgramRepository{

  final ProgramRemoteImplementation _remoteImplementation;

  ProgramDataImplementation({
    required ProgramRemoteImplementation remoteImplementation
  }) : _remoteImplementation = remoteImplementation;

  @override
  Future<List<Modulo>> getTopics() {
    return _remoteImplementation.getLecturers();
  }

}