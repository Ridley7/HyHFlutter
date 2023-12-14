import 'package:hiberus_university/models/program/capitulo.dart';

class Modulo {
  String tituloModulo;
  List<Capitulo> listaCapitulo;
  String nameTechnology;
  String imageTechnology;

  Modulo(
      {required this.tituloModulo,
        required this.listaCapitulo,
        required this.nameTechnology,
        required this.imageTechnology});
}