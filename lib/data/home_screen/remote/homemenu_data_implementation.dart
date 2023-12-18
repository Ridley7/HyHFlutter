import 'package:hiberus_university/data/home_screen/homemenu_remote_implementation.dart';
import 'package:hiberus_university/domain/home_repository.dart';
import 'package:hiberus_university/models/home_screen/item_menu.dart';

class HomemenuDataImplementation extends HomeRepository{

  final HomemenuRemoteImplementation _remoteImplementation;

  HomemenuDataImplementation({
    required HomemenuRemoteImplementation remoteImplementation
  }) : _remoteImplementation = remoteImplementation;


  @override
  Future<List<ItemMenu>> getMainMenu() {
    // TODO: implement getMainMenu
    return _remoteImplementation.getMainMenu();
  }

}