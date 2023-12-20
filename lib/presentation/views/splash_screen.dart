
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/presentation/navigation/navigation_routes.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (){
      context.go(NavigationRoutes.HOME_SCREEN_ROUTE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantsApp.SplashBackground,
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                child: Lottie.asset('assets/animations/cloud.json'),
              ),
              Image.asset("assets/images/hiberus_logo.jpg")
            ],
          )
      ),
    );
  }
}