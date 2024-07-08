import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/palette.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Palette.secondary,
      elevation: 0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
