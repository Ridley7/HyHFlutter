import 'package:flutter/material.dart';

class HolyDayCalendar extends StatelessWidget {
  const HolyDayCalendar({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: Colors.red,
          border: Border.all(
              color: Colors.black,
              width: 2.0
          )
      ),
      child: Center(
        child: Text(
          "${date.day}",
          style: TextStyle().copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}