import 'package:hiberus_university/models/program_screen/modulo.dart';

abstract class ProgramRepository{
  Future<List<Modulo>> getTopics();
}