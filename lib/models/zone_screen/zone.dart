import 'package:flutter/material.dart';

class Zone{
  int id;
  String name;
  String description;
  int spots;
  String schedule;
  Offset cornerTopLeft;
  Offset cornerBottomRight;
  bool tapped;
  Color selectedColor;
  Color unselectedColor;

  Zone({
    required this.id,
    required this.name,
    required this.description,
    required this.spots,
    required this.schedule,
    required this.cornerTopLeft,
    required this.cornerBottomRight,
    required this.tapped,
    required this.selectedColor,
    required this.unselectedColor
  });

  factory Zone.fromJson(Map<String, dynamic> json) {
    return Zone(
      id: json["id"],
      name: json["name"],
      spots: json["spots"],
      tapped: json["tapped"],
      schedule: json["schedule"],
      description: json["description"],
      cornerTopLeft: Offset(json["cornerTopLeft"]["dx"].toDouble(), json["cornerTopLeft"]["dy"].toDouble()),
      cornerBottomRight: Offset(json["cornerBottomRight"]["dx"].toDouble(), json["cornerBottomRight"]["dy"].toDouble()),
      selectedColor: Color.fromRGBO(
        json["selectedColor"]["red"],
        json["selectedColor"]["green"],
        json["selectedColor"]["blue"],
        json["selectedColor"]["alpha"].toDouble()
      ),

      unselectedColor: Color.fromRGBO(
          json["unselectedColor"]["red"],
          json["unselectedColor"]["green"],
          json["unselectedColor"]["blue"],
          json["unselectedColor"]["alpha"].toDouble()
      )

    );
  }

}