import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.label,
    this.textStyle = const TextStyle(fontSize: 14.0),
  });

  final String label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final Text customText = Text(label, style: textStyle);

    return customText;
  }
}

class TextH1 extends CustomText {
  const TextH1({
    super.key,
    required super.label,
  });

  const TextH1.caption({
    super.key,
    required super.label,
  });
}
