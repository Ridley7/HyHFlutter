import 'package:go_router/go_router.dart';
import 'package:hiberus_university/models/instructors_screen/Instructor.dart';
import 'package:hiberus_university/presentation/views/lecturers_screen/detail_lecturer.dart';
import 'package:hiberus_university/presentation/views/program_screen/program_screen.dart';
import 'package:hiberus_university/presentation/views/hiberus_screen/hiberus_screen.dart';
import 'package:hiberus_university/presentation/views/home_screen/home_screen.dart';
import 'package:hiberus_university/presentation/views/lecturers_screen/lecturers_screen.dart';
import 'package:hiberus_university/presentation/views/schedule_screen/schedule_screen.dart';
import 'package:hiberus_university/presentation/views/zones_screen/zones_screen.dart';

class NavigationRoutes{
  static const String INITIAL_ROUTE = "/";
  static const String HIBERUS_SCREEN_ROUTE = "/hiberus";
  static const String ZONES_SCREEN_ROUTE = "/zones";
  static const String LECTURES_SCREEN_ROUTE = "/lecturers";
  static const String SCHEDULE_SCREEN_ROUTE = "/schedule";
  static const String PROGRAM_SCREEN_ROUTE = "/program";
  static const String LECTURER_DETAIL_ROUTE = "$LECTURES_SCREEN_ROUTE/$_LECTURER_DETAIL_PATH";

  static const String _LECTURER_DETAIL_PATH = "lecturer_detail";
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
        builder: (context, state) => const LecturersScreen(),
        routes: [
          GoRoute(
              path: NavigationRoutes._LECTURER_DETAIL_PATH,
            builder: (context, state) => DetailLecturer(
                instructor: state.extra as Instructor
            )
          )
        ]
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
