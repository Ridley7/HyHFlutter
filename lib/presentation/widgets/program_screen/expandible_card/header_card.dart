import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard(
      {Key? key,
        required this.callback,
        required this.nameTechnology,
        required this.imageBackground})
      : super(key: key);

  final VoidCallback callback;
  final String nameTechnology;
  final String imageBackground;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: CachedNetworkImageProvider(imageBackground),
            height: 240,
            fit: BoxFit.fitWidth,
            child: InkWell(onTap: callback),
          ),
          Text(
            nameTechnology,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
          )
        ],
      ),
    );
  }
}