import 'package:flutter/material.dart';
import 'package:hiberus_university/models/program/capitulo.dart';
import 'package:hiberus_university/widgets/program/expandible_card/content_card.dart';
import 'package:hiberus_university/widgets/program/expandible_card/header_card.dart';

class ExpandibleCard extends StatefulWidget {
  ExpandibleCard(
      {Key? key,
        required this.titleModule,
        required this.listChapters,
        required this.nameTechnology,
        required this.imageTechnology})
      : super(key: key);

  final String titleModule;
  final List<Capitulo> listChapters;
  final String nameTechnology;
  final String imageTechnology;

  @override
  State<ExpandibleCard> createState() => _ExpandibleCardState();
}

class _ExpandibleCardState extends State<ExpandibleCard>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Tween<double> _sizeTween;

  bool _isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));

    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _sizeTween = Tween(begin: 0, end: 1);
    super.initState();
  }

  void _expandOnChanged() {
    _isExpanded = !_isExpanded;
    _isExpanded ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      children: [
        HeaderCard(
          callback: _expandOnChanged,
          imageBackground: widget.imageTechnology,
          nameTechnology: widget.nameTechnology,
        ),
        ContentCard(
          sizeTween: _sizeTween,
          animation: _animation,
          titleModule: widget.titleModule,
          listChapters: widget.listChapters,
        ),
      ],
    );
  }
}