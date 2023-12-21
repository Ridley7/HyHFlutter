import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberus_university/presentation/constants/strings_app.dart';
import 'package:hiberus_university/presentation/widgets/hiberus_screen/corporative_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage("assets/images/background_hiberus_university.jpg"),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/logo_hiberus_white.png",
            width: size.width / 2.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsApp.HIBERUS_UNIVERSITY,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 48),
                ),
                const Text(
                  StringsApp.FORMATE_CON_NOSOTROS,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              width: size.width * 0.6,
              height: size.height * 0.1,
              child: CorporativeButton(
                callback: (){
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceIn);
                },
                text: StringsApp.MAS_INFORMACION,
              )
            ),
          )
        ],
      ),
    );
  }
}
