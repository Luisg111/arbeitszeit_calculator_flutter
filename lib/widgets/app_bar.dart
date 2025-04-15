import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final List<Widget> actions;

  const CustomAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.title = "Arbeitszeit Calculator",
    this.actions = const [],
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), actions: actions);
  }
}
