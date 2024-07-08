import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/palette.dart';

abstract class RoundedRectangleButtonView extends StatelessWidget {
  const RoundedRectangleButtonView({
    super.key,
    required this.child,
    required this.onPressed,
    this.height,
    this.width = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.padding = const EdgeInsets.symmetric(vertical: 11.0, horizontal: 35.0),
    this.buttonBgColor = Palette.primary,
  })  : assert(height == null || height >= 0,
            '"height" cannot be a negative value.'),
        assert(
            width == null || width >= 0, '"width" cannot be a negative value.');

  /// Child for the button.
  final Widget child;

  /// OnPressed function for the button.
  final void Function() onPressed;

  /// The [height] if the widget built.
  final double? height;

  /// The [width] if the widget built.
  final double? width;

  /// To adjust the border radius.
  final BorderRadiusGeometry borderRadius;

  /// To adjust the padding.
  final EdgeInsetsGeometry padding;

  /// Set the background color of the button.
  final Color buttonBgColor;

  @override
  Widget build(BuildContext context) {
    final ElevatedButton buttonLayout = ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        padding: MaterialStateProperty.all(padding),
        backgroundColor: MaterialStateProperty.all<Color>(
          buttonBgColor,
        ),
      ),
      child: child,
    );

    Widget layout = buttonLayout;

    if (height != null || width != null) {
      layout = SizedBox(
        width: width,
        height: height,
        child: buttonLayout,
      );
    }

    return layout;
  }
}

class RoundedRectangleButton extends RoundedRectangleButtonView {
  const RoundedRectangleButton({
    super.key,
    required super.child,
    required super.onPressed,
    super.padding,
  });

  const RoundedRectangleButton.withSize({
    super.key,
    required super.child,
    required super.onPressed,
    super.width = 100.0,
    super.height,
    super.padding,
  });
}
