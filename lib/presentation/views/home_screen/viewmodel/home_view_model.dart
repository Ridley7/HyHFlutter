import 'dart:async';

import 'package:hiberus_university/domain/home_repository.dart';
import 'package:hiberus_university/models/home_screen/item_menu.dart';
import 'package:hiberus_university/models/resource_state.dart';
import 'package:hiberus_university/presentation/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel{

  final HomeRepository _homeRepository;

  final StreamController<ResourceState<List<ItemMenu>>> getMainMenuState = StreamController();

  HomeViewModel({
    required HomeRepository homeRepository
  }): _homeRepository = homeRepository;

  fetchMainMenu(){
    getMainMenuState.add(ResourceState.loading());

    _homeRepository.getMainMenu()
    .then((value) {
      List<ItemMenu> tempList = value;
      print("FLAG 200 *******************************************************************");
      print(tempList.length);

      getMainMenuState.add(ResourceState.success(value));
    })
    .catchError((error) => getMainMenuState.add(ResourceState.error(error)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    getMainMenuState.close();
  }

}