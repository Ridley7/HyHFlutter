import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hiberus_university/presentation/constants/constants_app.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key? key,
    required this.imageBackground,
    required this.labelSection,
    required this.callback,
    required this.width,
    required this.leftLabel,
    required this.rightLabel
  }) : super(key: key);

  final String imageBackground;
  final String labelSection;
  final VoidCallback callback;
  final double? width;
  final double? leftLabel;
  final double? rightLabel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          child: CachedNetworkImage(
            imageUrl: imageBackground,
            width: width,
            fit: BoxFit.cover,
          ),
          onTap: (){
            callback();
          },
        ),

        Positioned(
          top: 50.0,
          left: leftLabel,
          right: rightLabel,
          child: Container(
            decoration: const BoxDecoration(color: ConstantsApp.BlueHiberusDark),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              labelSection,
              style: ConstantsApp.LabelMenuTile
            ),
          ),
        )
      ],
    );
  }
}
