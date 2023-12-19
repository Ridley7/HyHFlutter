import 'package:hiberus_university/data/remote/error/remote_error_mapper.dart';
import 'package:hiberus_university/data/remote/network_client.dart';
import 'package:hiberus_university/data/remote/network_constants.dart';
import 'package:hiberus_university/models/instructors_screen/Instructor.dart';

class LecturersRemoteImplementation {

  final NetworkClient _networkClient;

  LecturersRemoteImplementation({
    required NetworkClient networkClient
  }) : _networkClient = networkClient;

  Future<List<Instructor>> getLecturers() async {
    try {
      final response = await _networkClient.dio.get(NetworkConstants.LECTURERS_PATH);
      final List listResponse = response.data;
      return listResponse.map((instructor) => Instructor.fromJson(instructor)).toList();

    } catch (error) {
      throw RemoteErrorMapper.getException(error);
    }
  }
}