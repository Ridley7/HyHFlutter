import 'package:get_it/get_it.dart';
import 'package:hiberus_university/data/home_screen/homemenu_remote_implementation.dart';
import 'package:hiberus_university/data/home_screen/remote/homemenu_data_implementation.dart';
import 'package:hiberus_university/data/lecturers_screen/lecturers_remote_implementation.dart';
import 'package:hiberus_university/data/lecturers_screen/remote/lecturers_data_implementation.dart';
import 'package:hiberus_university/data/program_screen/program_remote_implementation.dart';
import 'package:hiberus_university/data/program_screen/remote/ProgramDataImplementation.dart';
import 'package:hiberus_university/data/remote/network_client.dart';
import 'package:hiberus_university/data/schedule_screen/remote/schedule_data_implementation.dart';
import 'package:hiberus_university/data/schedule_screen/schedule_remote_implementation.dart';
import 'package:hiberus_university/data/zones_screen/remote/zones_data_implementation.dart';
import 'package:hiberus_university/data/zones_screen/zones_remote_implementation.dart';
import 'package:hiberus_university/domain/home_repository.dart';
import 'package:hiberus_university/domain/lecturers_repository.dart';
import 'package:hiberus_university/domain/program_repository.dart';
import 'package:hiberus_university/domain/schedule_repository.dart';
import 'package:hiberus_university/domain/zones_repository.dart';
import 'package:hiberus_university/presentation/views/home_screen/viewmodel/home_view_model.dart';
import 'package:hiberus_university/presentation/views/lecturers_screen/viewmodel/LecturersViewModel.dart';
import 'package:hiberus_university/presentation/views/program_screen/viewmodel/program_view_model.dart';
import 'package:hiberus_university/presentation/views/schedule_screen/viewmodel/schedule_viewmodel.dart';
import 'package:hiberus_university/presentation/views/zones_screen/viewmodel/zones_view_model.dart';

final inject = GetIt.instance;

class AppModules{
  setup(){
    _setupMainModule();
    _setupHomeMenuModule();
    _setupZonesModule();
    _setupLecturersModule();
    _setupScheduleModule();
    _setupProgramModule();
  }

  _setupProgramModule(){
    inject.registerFactory(() => ProgramRemoteImplementation(networkClient: inject.get()));
    inject.registerFactory<ProgramRepository>(() => ProgramDataImplementation(remoteImplementation: inject.get()));
    inject.registerFactory(() => ProgramViewModel(programRepository: inject.get()));
  }
  
  _setupScheduleModule(){
    inject.registerFactory(() => ScheduleRemoteImplementation(networkClient: inject.get()));
    inject.registerFactory<ScheduleRepository>(() => ScheduleDataImplementation(remoteImplementation: inject.get()));
    inject.registerFactory(() => ScheduleViewModel(scheduleRepository: inject.get()));
  }

  _setupLecturersModule(){
    inject.registerFactory(() => LecturersRemoteImplementation(networkClient: inject.get()));
    inject.registerFactory<LecturersRepository>(() => LecturersDataImplementation(remoteImplementation: inject.get()));
    inject.registerFactory(() => LecturersViewModel(lecturersRepository: inject.get()));
  }

  _setupZonesModule(){
    inject.registerFactory(() => ZonesRemoteImplementation(networkClient: inject.get()));
    inject.registerFactory<ZonesRepository>(() => ZonesDataImplementation(remoteImplementation: inject.get()));
    inject.registerFactory(() => ZonesViewModel(zoneRepository: inject.get()));
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