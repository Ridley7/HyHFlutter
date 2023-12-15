import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberus_university/pages/ClasesHiberus.dart';
import 'package:hiberus_university/presentation/views/hiberus_screen/pages/contact_page.dart';
import 'package:hiberus_university/presentation/views/hiberus_screen/pages/info_graphic_page.dart';
import 'package:hiberus_university/presentation/views/hiberus_screen/pages/landing_page.dart';

import 'pages/bet_talent_page.dart';

class HiberusScreen extends StatefulWidget {
  const HiberusScreen({Key? key}) : super(key: key);

  @override
  State<HiberusScreen> createState() => _HiberusScreenState();
}

class _HiberusScreenState extends State<HiberusScreen> {
  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              LandingPage(pageController: _pageController),
              const BetTalentPage(),
              const InfoGraphicPage(),
              const ContactPage(),
            ],
          )
        ],
      ),
    );
  }
}


