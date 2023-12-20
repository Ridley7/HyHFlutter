
import 'package:hiberus_university/models/program_screen/subcapitulo.dart';

class Capitulo {
  String texto;
  List<Subcapitulo>? listaSubcapitulos;

  Capitulo({required this.texto, required this.listaSubcapitulos});

  factory Capitulo.fromJson(Map<String, dynamic> json) {
    return Capitulo(
      texto: json["texto"],
      listaSubcapitulos: List<Subcapitulo>.from(json["listaSubcapitulos"].map((x) => Subcapitulo.fromJson(x))),
    );
  }
}