import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First screen"),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Hello first screen!"),
        ),
      ),
    );
  }
}
