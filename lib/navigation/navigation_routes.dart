import 'package:go_router/go_router.dart';
import 'package:hiberus_university/pages/HomePage.dart';
import 'package:hiberus_university/pages/first_page.dart';
import 'package:hiberus_university/pages/second_page.dart';
import 'package:hiberus_university/pages/third_page.dart';

final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage(), routes: [
        GoRoute(path: 'first', builder: (context, state) => const FirstPage()),
        GoRoute(path: 'second', builder: (context, state) => const SecondPage()),
        GoRoute(path: 'third', builder: (context, state) => const ThirdPage()),
      ]),
    ]
);