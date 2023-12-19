import 'package:hiberus_university/data/zones_screen/zones_remote_implementation.dart';
import 'package:hiberus_university/domain/zones_repository.dart';
import 'package:hiberus_university/models/zone_screen/zone.dart';

class ZonesDataImplementation extends ZonesRepository{

  final ZonesRemoteImplementation _remoteImplementation;

  ZonesDataImplementation({
    required ZonesRemoteImplementation remoteImplementation
  }) : _remoteImplementation = remoteImplementation;

  @override
  Future<Map<int, Zone>> getHiberusZones() {
    // TODO: implement getHiberusZones
    return _remoteImplementation.getHiberusZones();
  }

}