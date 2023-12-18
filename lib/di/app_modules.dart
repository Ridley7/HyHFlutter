import 'package:get_it/get_it.dart';
import 'package:hiberus_university/data/home_screen/homemenu_remote_implementation.dart';
import 'package:hiberus_university/data/home_screen/remote/homemenu_data_implementation.dart';
import 'package:hiberus_university/data/remote/network_client.dart';
import 'package:hiberus_university/domain/home_repository.dart';
import 'package:hiberus_university/presentation/views/home_screen/viewmodel/home_view_model.dart';

final inject = GetIt.instance;

class AppModules{
  setup(){
    _setupMainModule();
    _setupHomeMenuModule();
  }

  _setupHomeMenuModule(){
    inject.registerFactory(() => HomemenuRemoteImplementation(networkClient: inject.get()));
    inject.registerFactory<HomeRepository>(() => HomemenuDataImplementation(remoteImplementation: inject.get()));
    inject.registerFactory(() => HomeViewModel(homeRepository: inject.get()));
  }

  _setupMainModule(){
    inject.registerSingleton(NetworkClient());
  }
  
}