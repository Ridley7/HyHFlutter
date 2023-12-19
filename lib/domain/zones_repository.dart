import 'package:hiberus_university/models/zone_screen/zone.dart';

abstract class ZonesRepository{
  Future<Map<int, Zone>> getHiberusZones();
}