import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';

class InfoGraphicWidget extends StatelessWidget {
  const InfoGraphicWidget({
    super.key, required this.routeIcon, required this.description,
  });

  final String routeIcon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(routeIcon),
        const SizedBox(
          height: 20,
        ),
        Text(
            description,
            textAlign: TextAlign.center,
            style: ConstantsApp.InfoGraphicPage
        )
      ],
    );
  }
}

