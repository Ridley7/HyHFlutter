import 'package:hiberus_university/models/program_screen/capitulo.dart';

class Modulo {
  String tituloModulo;
  List<Capitulo> listaCapitulo;
  String nameTechnology;
  String imageTechnology;

  Modulo({
    required this.tituloModulo,
        required this.listaCapitulo,
        required this.nameTechnology,
        required this.imageTechnology
  });

  factory Modulo.fromJson(Map<String, dynamic> json) {
    return Modulo(
      tituloModulo: json["tituloModulo"],
      listaCapitulo: List<Capitulo>.from(json["listaCapitulo"].map((x) => Capitulo.fromJson(x))),
      nameTechnology: json["nameTechnology"],
      imageTechnology: json["imageTechnology"],
    );
  }



}