import 'package:flutter/material.dart';
import 'package:hiberus_university/pages/ClasesHiberus.dart';
import 'package:hiberus_university/pages/EspaciosScreen.dart';
import 'package:hiberus_university/pages/HiberusScreen.dart';
import 'package:hiberus_university/pages/HomeScreen.dart';
import 'package:hiberus_university/pages/ListPokemon.dart';
import 'package:hiberus_university/pages/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiberus University',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: //ListPokemon()
      //SplashScreen(),
      HiberusScreen(),
      //ClasesHiberus()
      //EspaciosScreen()
      //HomeScreen()
    );
  }
}
