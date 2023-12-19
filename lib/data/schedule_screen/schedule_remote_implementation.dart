import 'package:hiberus_university/data/remote/error/remote_error_mapper.dart';
import 'package:hiberus_university/data/remote/network_client.dart';
import 'package:hiberus_university/data/remote/network_constants.dart';
import 'package:hiberus_university/models/schedule_screen/info_day.dart';

class ScheduleRemoteImplementation{
  final NetworkClient _networkClient;

  ScheduleRemoteImplementation({
    required NetworkClient networkClient
  }) : _networkClient = networkClient;

  Future<Map<DateTime, InfoDay>> getScheduleEvents() async{
    try {
      final response = await _networkClient.dio.get(NetworkConstants.SCHEDULE_PATH);
      final Map mapResponse = response.data;
      Map<DateTime, InfoDay> mapTemp = {};
      mapResponse.forEach((key, value) {
        mapTemp[DateTime.parse(key)] = InfoDay.fromJson(value);
      });
      return mapTemp;
    } catch (error) {
      throw RemoteErrorMapper.getException(error);
    }
  }
}