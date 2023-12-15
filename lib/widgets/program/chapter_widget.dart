import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/models/program_screen/capitulo.dart';

import 'package:hiberus_university/widgets/program/subchapter_widget.dart';

class ChapterWidget extends StatelessWidget {
  const ChapterWidget({super.key, required this.chapter});

  final Capitulo chapter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chapter.texto,
                  style: ConstantsApp.ChapterModule,
                ),
                chapter.listaSubcapitulos == null
                    ? Container()
                    : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: chapter.listaSubcapitulos!.map((subchapter) {
                      return Subchapter(subchapter: subchapter);
                    }).toList())
              ],
            )),
      ],
    );
  }
}