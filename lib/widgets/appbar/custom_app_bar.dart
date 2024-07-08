import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/app_style.dart';
import 'package:flutter_todo_app/styles/palette.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.autoLeading = true,
    this.leading,
    this.actions,
    this.elevation,
    this.appbarTitleStyle = AppStyle.text24W700Black,
  });

  final String title;
  final bool centerTitle;
  final bool autoLeading;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;
  final TextStyle? appbarTitleStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: appbarTitleStyle,
      ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: autoLeading,
      shadowColor: Palette.scaffoldBackgroundColor,
      surfaceTintColor: Palette.scaffoldBackgroundColor,
      leading: leading,
      actions: actions,
      elevation: elevation,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
