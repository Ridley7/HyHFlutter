
import 'package:flutter/material.dart';

class HiberusScreen extends StatelessWidget {
  const HiberusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Image.asset("assets/images/background_hiberus_university.jpg",
          fit: BoxFit.fill,)
      ),
    );
  }
}


