import 'package:flutter/material.dart';

class Espacio{
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

  Espacio({
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


}