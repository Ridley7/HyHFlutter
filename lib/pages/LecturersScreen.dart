import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiberus_university/models/Instructor.dart';
import 'package:hiberus_university/pages/DetailLecturer.dart';

class LecturersScreen extends StatelessWidget {
  const LecturersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Instructor> listaInstructores = [
      Instructor(
          id: 0,
          name: "Marcos Calvo García",
          urlImage: "https://media.istockphoto.com/id/1388253782/es/foto/positivo-exitoso-hombre-de-negocios-profesional-de-negocios-del-milenio-retrato-de-la-cabeza.jpg?s=612x612&w=0&k=20&c=gDMgYu50FUOTQhCZwYM6deYTzHvKkKAK9e945a21hZ8=",
          bio: "Biografia del instructor",
          firstTechnology: Tech.android,
        secondTechnology: Tech.ios,
        thirdTechnology: Tech.flutter,
        jobTitle: "Tech Lead Hiberus",
        urlGithub: "",
        urlLinkedin: "",
        urlTwitter: ""
      ),

      Instructor(
          id: 1,
          name: "Alberto Navas Alba",
          urlImage: "https://media.istockphoto.com/id/1476170969/es/foto/retrato-de-un-joven-listo-para-el-trabajo-concepto-de-negocio.jpg?s=612x612&w=0&k=20&c=AAuUZOmmNYo6hzDYNR7d88Ihnxo4jrypqVJa-B8vjys=",
          bio: "Biografia del instructor",
          firstTechnology: Tech.android,
          secondTechnology: null,
          thirdTechnology: null,
          jobTitle: "Tech Lead Hiberus",
          urlGithub: "Desarrollador de Software Senior",
          urlLinkedin: "",
          urlTwitter: ""
      ),

      Instructor(
          id: 2,
          name: "Javier Torne Hernández",
          urlImage: "https://media.istockphoto.com/id/1307791650/es/foto/retrato-a-la-cabeza-del-sonriente-empresario-cauc%C3%A1sico-posa-en-el-lugar-de-trabajo.jpg?s=612x612&w=0&k=20&c=h7JT5UHiPf_S7JBLq6tG5os21j6tn_pxYSjzzuRXpjg=",
          bio: "Biografia del instructor",
          firstTechnology: Tech.ios,
          secondTechnology: null,
          thirdTechnology: null,
          jobTitle: "iOS Tech Lead",
          urlGithub: "",
          urlLinkedin: "",
          urlTwitter: ""
      ),

      Instructor(
          id: 3,
          name: "Javier Cobos Escalante",
          urlImage: "https://cdn.pixabay.com/photo/2018/11/08/23/52/man-3803551_1280.jpg",
          bio: "Biografia del instructor",
          firstTechnology: Tech.ios,
          secondTechnology: null,
          thirdTechnology: null,
          jobTitle: "iOS Tech Lead",
          urlGithub: "",
          urlLinkedin: "",
          urlTwitter: ""
      ),

      Instructor(
          id: 4,
          name: "Alejandro Giménez Garulo",
          urlImage: "https://media.istockphoto.com/id/1398338985/es/foto/cabeza-de-un-hombre-con-el-cabello-te%C3%B1ido-de-azul-sonriendo-en-el-interior.jpg?s=612x612&w=0&k=20&c=QUl332WLxJIubp9oOVMoQk6CO3QjL-RMohFTgmHfJeI=",
          bio: "Biografia del instructor",
          firstTechnology: Tech.scrum,
          secondTechnology: null,
          thirdTechnology: null,
          jobTitle: "Lecturer / Trainer Gráfico",
          urlGithub: "",
          urlLinkedin: "",
          urlTwitter: ""
      ),

      Instructor(
          id: 5,
          name: "Daniel Chueca",
          urlImage: "https://media.istockphoto.com/id/517614873/es/foto/modelo-masculino-en-el-estudio.jpg?s=612x612&w=0&k=20&c=mDVaZjvVSpUGsVSLCQTbu7NtObVkgTsHjntlnddH1wY=",
          bio: "Biografia del instructor",
          firstTechnology: Tech.flutter,
          secondTechnology: null,
          thirdTechnology: null,
          jobTitle: "Flutter Developer",
          urlGithub: "",
          urlLinkedin: "",
          urlTwitter: ""
      ),
    ];

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

enum Tech{
  android,
  ios,
  flutter,
  scrum
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




































