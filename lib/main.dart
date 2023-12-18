import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hiberus_university/di/app_modules.dart';
import 'package:hiberus_university/presentation/navigation/navigation_routes.dart';

void main() {
  AppModules().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: router,
      title: 'Hiberus University',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
        ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );

  }
}
