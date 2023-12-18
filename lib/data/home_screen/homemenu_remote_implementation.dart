import 'dart:isolate';

import 'package:hiberus_university/data/remote/error/remote_error_mapper.dart';
import 'package:hiberus_university/data/remote/network_client.dart';
import 'package:hiberus_university/data/remote/network_constants.dart';
import 'package:hiberus_university/models/home_screen/item_menu.dart';

class HomemenuRemoteImplementation{
  
  final NetworkClient _networkClient;
  
  HomemenuRemoteImplementation({
    required NetworkClient networkClient
}): _networkClient = networkClient;
  
  Future<List<ItemMenu>> getMainMenu() async{
    try{
      final response = await _networkClient.dio.get(NetworkConstants.HOME_MENU_PATH);
      final List listResponse = response.data;
      return listResponse.map((itemMenu) => ItemMenu.fromJson(itemMenu)).toList();

    }catch (error){
      throw RemoteErrorMapper.getException(error);
    }
  }
  
}