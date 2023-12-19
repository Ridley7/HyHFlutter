import 'package:hiberus_university/data/remote/error/remote_error_mapper.dart';
import 'package:hiberus_university/data/remote/network_client.dart';
import 'package:hiberus_university/data/remote/network_constants.dart';
import 'package:hiberus_university/models/zone_screen/zone.dart';

class ZonesRemoteImplementation {

  final NetworkClient _networkClient;

  ZonesRemoteImplementation({
    required NetworkClient networkClient
  }) : _networkClient = networkClient;

  Future<Map<int, Zone>> getHiberusZones() async {
    try {
      final response = await _networkClient.dio.get(NetworkConstants.ZONES_PATH);
      final Map mapResponse = response.data;
      Map<int, Zone> mapTemp = {};
      mapResponse.forEach((key, value) {
        mapTemp[int.parse(key)] = Zone.fromJson(value);
      });
      return mapTemp;
    } catch (error) {
      throw RemoteErrorMapper.getException(error);
    }
  }
}