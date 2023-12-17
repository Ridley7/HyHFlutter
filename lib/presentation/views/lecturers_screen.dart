import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberus_university/models/instructors_screen/Instructor.dart';
import 'package:hiberus_university/models/instructors_screen/tech.dart';
import 'package:hiberus_university/pages/DetailLecturer.dart';
import 'package:hiberus_university/raw_data/raw_data.dart';

class LecturersScreen extends StatelessWidget {
  const LecturersScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
        
            Text(
              "Instructores",
              style: GoogleFonts.montserrat(
                color: Color(0xFF133963),
                fontWeight: FontWeight.bold,
                fontSize: 30
              )
            ),
        
            Flexible(
              child: GridView.count(
                childAspectRatio: 0.7,
                //physics: NeverScrollableScrollPhysics(),
                  //shrinkWrap: true,
                  crossAxisCount: 2,


                children: listaInstructores.map((instructor)  {
                  return InstructorWidget(instructor: instructor);
                }).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class InstructorWidget extends StatelessWidget {
  const InstructorWidget({
    super.key,
    required this.instructor
  });

  final Instructor instructor;

  @override
  Widget build(BuildContext context) {

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

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DetailLecturer(instructor: instructor)
          )
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF133963),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
}

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




































