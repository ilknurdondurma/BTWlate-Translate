import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final Color color;
  final String hintText;
  final double fieldRadius;
  final TextInputType inputType;
  final Icon prefixIcon;
  final bool obsecure;

  const MyTextFieldWidget({
    super.key,
    required this.controller,
    required this.color,
    required this.hintText,
    required this.fieldRadius,
    required this.inputType,
    required this.prefixIcon,
    required this.obsecure

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: color,
      keyboardType: inputType,
      decoration: InputDecoration(
          hintText:hintText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color:color),
            borderRadius: BorderRadius.circular(fieldRadius),)
      ),
      obscureText: obsecure,

    );
  }
}