import 'package:flutter/material.dart';
import 'package:hiberus_university/models/hiberus_screen/info_graphic.dart';
import 'package:hiberus_university/presentation/constants/constants_app.dart';
import 'package:hiberus_university/presentation/widgets/hiberus_screen/info_graphic_widget.dart';

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

List<InfoGraphic> infografia = [
  InfoGraphic(
      routeAsset: "assets/images/alumnos.png",
      description: "Más de 1285 alumnos y alumnas en 2022"
  ),

  InfoGraphic(
      routeAsset: "assets/images/contratacion.png",
      description: "80% de contratación de alumnos"
  ),

  InfoGraphic(
      routeAsset: "assets/images/formacion.png",
      description: "Formación intensiva y especifica"
  ),

  InfoGraphic(
      routeAsset: "assets/images/tecnologias.png",
      description: "Tecnologías punteras en el mercado"
  ),

];