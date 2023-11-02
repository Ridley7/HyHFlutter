
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:  Container(
            padding: const EdgeInsets.all(10),
            child: Lottie.asset('assets/animations/cloud.json')
          )
      ),
    );
  }
}