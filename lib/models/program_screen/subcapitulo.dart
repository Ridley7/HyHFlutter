
import 'package:hiberus_university/models/program_screen/episodio.dart';

class Subcapitulo {

  String text;
  List<Episodio>? listaEpisodios;

  Subcapitulo({required this.text, required this.listaEpisodios});

  factory Subcapitulo.fromJson(Map<String, dynamic> json) {
    return Subcapitulo(
      text: json["text"],
      listaEpisodios: List<Episodio>.from(json["listaEpisodios"].map((x) => Episodio.fromJson(x))),
    );
  }
}