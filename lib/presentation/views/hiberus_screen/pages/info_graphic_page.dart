import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/raw_data/raw_data.dart';
import 'package:hiberus_university/widgets/hiberus/info_graphic_widget.dart';

class InfoGraphicPage extends StatelessWidget {
  const InfoGraphicPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ConstantsApp.BlueHiberusDark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: infografia.map((info) {
            return InfoGraphicWidget(
                routeIcon: info.routeAsset,
                description: info.description
            );
          }).toList()
        ));
  }
}

