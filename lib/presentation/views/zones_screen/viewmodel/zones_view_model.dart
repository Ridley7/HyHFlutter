import 'dart:async';

import 'package:hiberus_university/domain/zones_repository.dart';
import 'package:hiberus_university/models/resource_state.dart';
import 'package:hiberus_university/presentation/base/base_view_model.dart';

class ZonesViewModel extends BaseViewModel{

  final ZonesRepository _zoneRepository;

  final StreamController<ResourceState<Map<int, Zone>>> getZonesState = StreamController();

  ZonesViewModel({
    required ZonesRepository zoneRepository
  }): _zoneRepository = zoneRepository;

  fetchHiberusZones(){
    getZonesState.add(ResourceState.loading());

    _zoneRepository.getHiberusZones()
    .then((value) => getZonesState.add(ResourceState.success(value.cast<int, Zone>())))
    .catchError((error) => getZonesState.add(ResourceState.error(error)));
  }


  @override
  void dispose() {
    // TODO: implement dispose
    getZonesState.close();
  }

}