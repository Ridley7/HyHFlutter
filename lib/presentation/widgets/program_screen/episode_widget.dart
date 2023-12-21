import 'package:flutter/material.dart';
import 'package:hiberus_university/models/program_screen/episodio.dart';
import 'package:hiberus_university/presentation/constants/constants_app.dart';

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({
    super.key,
    required this.episodeList,
  });

  final List<Episodio>? episodeList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: episodeList!.map((episode) {
            return Text(episode.text, style: ConstantsApp.EpisodeModule);
          }).toList(),
        ));
  }
}
