import 'package:flutter/material.dart';

class RowDescriptionZone extends StatelessWidget {
  RowDescriptionZone({
    super.key,
    required this.routeIcon,
    required this.nameDescription,
    this.textDescription
  });

  final String routeIcon;
  final String nameDescription;
  String? textDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset("assets/images/${routeIcon}"),
          const SizedBox(width: 10,),
          Text(nameDescription, style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          Text(textDescription ?? "", style: const TextStyle(fontSize: 18, color: Colors.black)),
        ],
      ),
    );
  }
}
