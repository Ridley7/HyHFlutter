
import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19245A),
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