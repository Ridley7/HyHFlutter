import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:hiberus_university/extensions/navigation_extensions.dart';
import 'package:hiberus_university/pages/first_page.dart';
import 'package:hiberus_university/pages/second_page.dart';
import 'package:hiberus_university/pages/third_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Menu app"),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              FilledButton(
                child: const Text("Navigate to first screen"),
                onPressed: () async {
                  // navigate
                  final result = await context.push('/first');
                  print("Result: $result");
                },
              ),
              const SizedBox(height: 8),
              FilledButton(
                child: const Text("Navigate to second screen"),
                onPressed: () {
                  // navigate
                  context.push('/second');
                },
              ),
              const SizedBox(height: 8),
              FilledButton(
                child: const Text("Navigate to third screen"),
                onPressed: () async {
                  // navigate
                  context.push('/third');
                },
              ),
            ],
          ),
        ));
  }
}
