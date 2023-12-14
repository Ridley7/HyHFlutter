
import 'package:hiberus_university/presentation/views/lecturers_screen.dart';

class Instructor{
  int id;
  String name;
  String urlImage;
  String bio;
  Tech firstTechnology;
  Tech? secondTechnology;
  Tech? thirdTechnology;
  String jobTitle;
  String urlGithub;
  String urlTwitter;
  String urlLinkedin;

  Instructor({
    required this.id,
    required this.name,
    required this.urlImage,
    required this.bio,
    required this.firstTechnology,
    required this.secondTechnology,
    required this.thirdTechnology,
    required this.jobTitle,
    required this.urlGithub,
    required this.urlTwitter,
    required this.urlLinkedin
});
}