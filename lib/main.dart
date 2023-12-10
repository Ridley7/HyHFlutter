import 'package:flutter/material.dart';
import 'package:hiberus_university/navigation/navigation_routes.dart';
import 'package:hiberus_university/pages/ClasesHiberus.dart';
import 'package:hiberus_university/pages/DetailLecturer.dart';
import 'package:hiberus_university/pages/DetailPokemon.dart';
import 'package:hiberus_university/pages/EspaciosScreen.dart';
import 'package:hiberus_university/pages/HiberusScreen.dart';
import 'package:hiberus_university/pages/HomePage.dart';
import 'package:hiberus_university/pages/HomeScreen.dart';
import 'package:hiberus_university/pages/LecturersScreen.dart';
import 'package:hiberus_university/pages/ListPokemon.dart';
import 'package:hiberus_university/pages/SplashScreen.dart';
import 'package:hiberus_university/pages/schedule_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp.router(
      routerConfig: router,
    );
    */

    return MaterialApp(
      title: 'Hiberus University',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
        ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: //ScheduleScreen()
      //HomePage()
      //DetailLecturer(),
      //LecturersScreen(),
      //SplashScreen(),
      //HiberusScreen(),
      //ClasesHiberus()
      //EspaciosScreen()
      HomeScreen()

      //DetailPokemon()
      //ListPokemon()
    );

  }
}
