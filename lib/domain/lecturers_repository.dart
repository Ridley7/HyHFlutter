import 'package:hiberus_university/models/instructors_screen/Instructor.dart';

abstract class LecturersRepository{
  Future<List<Instructor>> getLecturers();
}