import 'package:hiberus_university/data/remote/error/remote_error_mapper.dart';
import 'package:hiberus_university/data/remote/network_client.dart';
import 'package:hiberus_university/data/remote/network_constants.dart';
import 'package:hiberus_university/models/program_screen/modulo.dart';

class ProgramRemoteImplementation{
  final NetworkClient _networkClient;

  ProgramRemoteImplementation({
    required NetworkClient networkClient
  }) : _networkClient = networkClient;

  Future<List<Modulo>> getLecturers() async {
    try {
      final response = await _networkClient.dio.get(NetworkConstants.PROGRAM_PATH);
      final List listResponse = response.data;
      return listResponse.map((module) => Modulo.fromJson(module)).toList();

    } catch (error) {
      throw RemoteErrorMapper.getException(error);
    }
  }
}