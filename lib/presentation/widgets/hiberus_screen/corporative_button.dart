import 'package:flutter/material.dart';

class CorporativeButton extends StatelessWidget {
  const CorporativeButton({
    super.key,
    required this.callback,
    required this.text
  });

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius:
              BorderRadius.circular(10.0)
          )
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white, fontSize: 22
          ),
        )
    );
  }
}