import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/constants/strings_app.dart';
import 'package:hiberus_university/raw_data/raw_data.dart';
import 'package:hiberus_university/widgets/program/expandible_card/expandible_card.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(StringsApp.TEMARIO, style: ConstantsApp.TittleApp),
              Column(
                children: temario.map((e) {
                  return ExpandibleCard(
                    titleModule: e.tituloModulo,
                    listChapters: e.listaCapitulo,
                    nameTechnology: e.nameTechnology,
                    imageTechnology: e.imageTechnology,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
