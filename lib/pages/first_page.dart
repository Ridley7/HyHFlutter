import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First screen"),
      ),
      body: SafeArea(
        child: Center(
          child: FilledButton(
            child: const Text("Go Back"),
              onPressed: () {
                context.pop("Hola con go router");
              },
          )
        ),
      ),
    );
  }
}
