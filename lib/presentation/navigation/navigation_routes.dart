import 'package:go_router/go_router.dart';
import 'package:hiberus_university/constants/strings_app.dart';
import 'package:hiberus_university/presentation/views/program_screen.dart';
import 'package:hiberus_university/presentation/views/hiberus_screen/hiberus_screen.dart';
import 'package:hiberus_university/presentation/views/home_screen.dart';
import 'package:hiberus_university/presentation/views/lecturers_screen.dart';
import 'package:hiberus_university/presentation/views/schedule_screen.dart';
import 'package:hiberus_university/presentation/views/zones_screen.dart';

class NavigationRoutes{
  static const String INITIAL_ROUTE = "/";
  static const String HIBERUS_SCREEN_ROUTE = "/hiberus";
  static const String ZONES_SCREEN_ROUTE = "/zones";
  static const String LECTURES_SCREEN_ROUTE = "/lecturers";
  static const String SCHEDULE_SCREEN_ROUTE = "/schedule";
  static const String PROGRAM_SCREEN_ROUTE = "/program";
}

final GoRouter router = GoRouter(
  initialLocation: NavigationRoutes.INITIAL_ROUTE,
  routes: [
    GoRoute(
        path: NavigationRoutes.INITIAL_ROUTE,
      builder: (context, state) => const HomeScreen()
    ),

    GoRoute(
      path: NavigationRoutes.HIBERUS_SCREEN_ROUTE,
      builder: (context, state) => const HiberusScreen()
    ),

    GoRoute(
        path: NavigationRoutes.ZONES_SCREEN_ROUTE,
        builder: (context, state) => const ZonesScreen()
    ),

    GoRoute(
        path: NavigationRoutes.LECTURES_SCREEN_ROUTE,
        builder: (context, state) => const LecturersScreen()
    ),

    GoRoute(
        path: NavigationRoutes.SCHEDULE_SCREEN_ROUTE,
        builder: (context, state) => const ScheduleScreen()
    ),

    GoRoute(
        path: NavigationRoutes.PROGRAM_SCREEN_ROUTE,
        builder: (context, state) => const ProgramScreen()
    ),
  ]
);
