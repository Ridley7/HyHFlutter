import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/models/program/subcapitulo.dart';
import 'package:hiberus_university/widgets/program/episode_widget.dart';

class Subchapter extends StatelessWidget {
  const Subchapter({super.key, required this.subchapter});

  final Subcapitulo subchapter;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subchapter.text,
              style: ConstantsApp.SubchapterModule,
            ),
            subchapter.listaEpisodios == null
                ? Container()
                : EpisodeWidget(episodeList: subchapter.listaEpisodios)
          ],
        ));
  }
}