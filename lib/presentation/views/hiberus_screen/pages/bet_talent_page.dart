import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/constants/strings_app.dart';

class BetTalentPage extends StatelessWidget {
  const BetTalentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  StringsApp.APOSTAMOS_POR_TU_TALENTO,
                  style: TextStyle(
                      fontSize: 36,
                      color: ConstantsApp.BlueHiberusDark,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  StringsApp.HIBERUS_PARAGRAPH_ONE,
                  style: TextStyle(fontSize: 17, height: 1),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text:
                          StringsApp.HIBERUS_PARAGRAPH_TWO_A,
                          style: TextStyle(
                              fontSize: 19, color: Colors.black)),
                      TextSpan(
                          text:
                          StringsApp.HIBERUS_PARAGRAPH_TWO_B,
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text:
                          StringsApp.HIBERUS_PARAGRAPH_TWO_C,
                          style: TextStyle(
                              fontSize: 19, color: Colors.black))
                    ]),
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                    StringsApp.HIBERUS_PARAGRAPH_THREE,
                    style: TextStyle(fontSize: 17, height: 1)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
