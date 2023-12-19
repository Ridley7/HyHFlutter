import 'package:hiberus_university/data/lecturers_screen/lecturers_remote_implementation.dart';
import 'package:hiberus_university/domain/lecturers_repository.dart';
import 'package:hiberus_university/models/instructors_screen/Instructor.dart';

class LecturersDataImplementation extends LecturersRepository{

  final LecturersRemoteImplementation _remoteImplementation;

  LecturersDataImplementation({
    required LecturersRemoteImplementation remoteImplementation
  }) : _remoteImplementation = remoteImplementation;

  @override
  Future<List<Instructor>> getLecturers() {
    // TODO: implement getLecturers
    return _remoteImplementation.getLecturers();
  }


}