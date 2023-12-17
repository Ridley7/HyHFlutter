import 'package:flutter/material.dart';

class IconTechWidget extends StatelessWidget {
  const IconTechWidget({
    super.key,
    required this.backgroundColor,
    required this.iconTechnology,
  });

  final Color backgroundColor;
  final IconData iconTechnology;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(iconTechnology, color: Colors.white,)
    );
  }
}
