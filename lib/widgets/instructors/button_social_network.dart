import 'package:flutter/material.dart';
import 'package:hiberus_university/constants/constants_app.dart';

class ButtonSocialNetwork extends StatelessWidget {
  const ButtonSocialNetwork({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: ConstantsApp.BlueHiberusDark,
      child: GestureDetector(
        child: Center(
          child: Icon(
            icon,
            size: 32,
            color: Colors.white,
          ),
        ),
        onTap: (){
        },
      ),
    );
  }
}
