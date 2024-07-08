import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/app_style.dart';
import 'package:flutter_todo_app/styles/palette.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.maxLines = 1,
    this.labelText,
    this.hintText,
    this.labelStyle = AppStyle.text11BoldT2,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.floatingLabelBehavior,
  });

  final TextEditingController controller;
  final int? maxLines;
  final String? labelText;
  final String? hintText;
  final TextStyle labelStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        maxLines: maxLines,
        readOnly: readOnly,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Palette.t4,
              width: 1.0,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Palette.t4,
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Palette.t3,
              width: 1.0,
            ),
            // borderRadius: BorderRadius.circular(25.0),
          ),
          // fillColor: Colors.red,
          labelText: labelText ?? '',
          labelStyle: labelStyle,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          alignLabelWithHint: true,
          floatingLabelBehavior: floatingLabelBehavior,
        ),
        style: TextStyle(
          fontSize: 12.0,
        ));
  }
}
