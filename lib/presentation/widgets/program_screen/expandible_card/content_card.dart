import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';
import 'package:hiberus_university/models/program_screen/capitulo.dart';
import 'package:hiberus_university/presentation/widgets/program_screen/chapter_widget.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.sizeTween,
    required this.animation,
    required this.titleModule,
    required this.listChapters,
  });

  final Tween<double> sizeTween;
  final Animation<double> animation;
  final String titleModule;
  final List<Capitulo> listChapters;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: sizeTween.animate(animation),
      child: AnimatedContainer(
          width: double.infinity,
          duration: const Duration(milliseconds: 150),
          alignment: Alignment.center,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: Text(titleModule, style: ConstantsApp.TitleModule),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listChapters.map((chapter) {
                return ChapterWidget(chapter: chapter);
              }).toList(),
            )
          ])),
    );
  }
}