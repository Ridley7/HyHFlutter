import 'package:flutter/material.dart';
import 'package:hiberus_university/presentation/constants/strings_app.dart';

class CustomFormWidget extends StatelessWidget {
  const CustomFormWidget({
    super.key,
    required this.controllerName,
    required this.hintText,
    this.expresionRegular,
    this.messageAdhoc,
    this.contentPadding
  });

  final TextEditingController controllerName;
  final String hintText;
  final RegExp? expresionRegular;
  final String? messageAdhoc;
  final double? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0),
      child: TextFormField(
        controller: controllerName,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: contentPadding != null
              ? EdgeInsets.symmetric(vertical: contentPadding!)
              : null,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(2)),
            borderSide:
            BorderSide(color: Colors.black54),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return StringsApp.CAMPO_OBLIGATORIO;
          }

          if(expresionRegular == null){
            return null;
          }

          if(!expresionRegular!.hasMatch(value)){
            return messageAdhoc;
          }

          return null;

        },
      ),
    );
  }
}
