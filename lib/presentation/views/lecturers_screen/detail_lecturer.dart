
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiberus_university/models/instructors_screen/Instructor.dart';
import 'package:hiberus_university/presentation/widgets/instructors_screen/button_social_network.dart';


class DetailLecturer extends StatelessWidget {
  const DetailLecturer({
    super.key,
    required this.instructor
  });

  final Instructor instructor;

  @override
  Widget build(BuildContext context) {

    const double coverHeight = 280;
    const double profileHeight = 144;
    const top = coverHeight - profileHeight / 2;
    const bottom = profileHeight / 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Fondo superior
            Container(
              margin: const EdgeInsets.only(bottom: bottom),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                      imageUrl: "https://cdn.pixabay.com/photo/2017/08/10/08/47/laptop-2620118_1280.jpg",
                  ),

                  //Imagen de perfil
                  Positioned(
                    top: top,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 10.0
                        )
                      ),

                      child: Hero(
                        tag: instructor.id,
                        child: CircleAvatar(
                          radius: profileHeight / 2,
                          backgroundImage: CachedNetworkImageProvider(
                            instructor.urlImage
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16.0,),

            Text(instructor.name,
              style: const TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black
              ),),

            const SizedBox(height: 8,),

            Text(instructor.jobTitle,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black26
              ),),

            const SizedBox(height: 16,),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSocialNetwork(icon: FontAwesomeIcons.apple),

                SizedBox(width: 12,),

                ButtonSocialNetwork(icon: FontAwesomeIcons.github),

                SizedBox(width: 12,),

                ButtonSocialNetwork(icon: FontAwesomeIcons.twitter),

                SizedBox(width: 12,),

                ButtonSocialNetwork(icon: FontAwesomeIcons.linkedin),
              ],
            ),

            //About
            const SizedBox(height: 16,),
            const Divider(),
            const SizedBox(height: 16,),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Acerca de",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(height: 16,),
                    Text(
                      "ferri theophrastus vero egestas legere nominavi maximus quo vituperata doctus porro non putent potenti consectetuer dignissim volumus fringilla montes postea",
                      style: TextStyle(fontSize: 18, height: 1.4)
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

