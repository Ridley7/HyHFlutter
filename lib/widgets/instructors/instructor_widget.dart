import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/models/instructors_screen/Instructor.dart';
import 'package:hiberus_university/models/instructors_screen/tech.dart';
import 'package:hiberus_university/presentation/navigation/navigation_routes.dart';
import 'package:hiberus_university/widgets/instructors/icon_tech_widget.dart';

class InstructorWidget extends StatelessWidget {
  const InstructorWidget({
    super.key,
    required this.instructor
  });

  final Instructor instructor;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){

        context.go(NavigationRoutes.LECTURER_DETAIL_ROUTE,
        extra: instructor
        );

      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: ConstantsApp.BlueHiberusDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [

            //Usamos ClipRRect porque Container no nos deja cortar por encima de la imagen
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)
              ),
              child: Hero(
                tag: instructor.id,
                child: CachedNetworkImage(
                  imageUrl: instructor.urlImage,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.center,
              child: Text(
                instructor.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            //Iconos de tecnologias
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  prepareListTech(instructor.firstTechnology),
                  const SizedBox(width: 8,),
                  prepareListTech(instructor.secondTechnology),
                  const SizedBox(width: 8,),
                  prepareListTech(instructor.thirdTechnology),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget prepareListTech(Tech? technology){

    switch(technology){
      case Tech.android:
        return const IconTechWidget(
            backgroundColor: Colors.greenAccent,
            iconTechnology: Icons.android);
      case Tech.ios:
        return const IconTechWidget(
            backgroundColor: Colors.grey,
            iconTechnology: Icons.apple);
      case Tech.flutter:
        return const IconTechWidget(
            backgroundColor: Colors.blueAccent,
            iconTechnology: Icons.flutter_dash);
      case Tech.scrum:
        return const IconTechWidget(
            backgroundColor: Colors.redAccent,
            iconTechnology: Icons.schedule
        );
      default:
        return const SizedBox();
    }
  }
}