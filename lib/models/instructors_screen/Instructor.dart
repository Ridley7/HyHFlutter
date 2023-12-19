
import 'package:hiberus_university/models/instructors_screen/tech.dart';

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

  factory Instructor.fromJson(Map<String, dynamic> json) {
   return Instructor(
      id: json["id"],
      bio: json["bio"],
      name: json["name"],
      jobTitle: json["jobTitle"],
      urlImage: json["urlImage"],
      urlGithub: json["urlGithub"],
      urlTwitter: json["urlTwitter"],
      urlLinkedin: json["urlLinkedin"],
      firstTechnology: _getTechValue(json["firstTechnology"]),
      thirdTechnology: json["thirdTechnology"] == null ? null : _getTechValue(json["thirdTechnology"]),
     secondTechnology: json["secondTechnology"] == null ? null:  _getTechValue(json["secondTechnology"]),
    );
  }

  static Tech _getTechValue(String techString) {
    for (Tech tech in Tech.values) {
      if (tech.value == techString) {
        return tech;
      }
    }
    throw Exception("Valor no válido para Tech: $techString");
  }

}