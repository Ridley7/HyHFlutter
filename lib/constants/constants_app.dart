import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstantsApp {
  static const Color BlueHiberusLight = Color(0xFF89BBF1);
  static const Color BlueHiberusDark = Color(0xFF133963);
  static const TextStyle TitleModule = TextStyle(
      fontSize: 20, color: BlueHiberusLight);
  static const TextStyle ChapterModule = TextStyle(
      fontSize: 20, color: BlueHiberusDark, fontWeight: FontWeight.bold);
  static const TextStyle SubchapterModule = TextStyle(
      fontSize: 18, color: Colors.black);
  static const TextStyle EpisodeModule = TextStyle(
      fontSize: 16, color: Colors.black);
  static TextStyle TittleApp = GoogleFonts.montserrat(
    color: BlueHiberusDark,
    fontWeight: FontWeight.bold,
    fontSize: 36
  );

  static const TextStyle LabelMenuTile = TextStyle (color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold);
  static const TextStyle InfoGraphicPage = TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold);

}
