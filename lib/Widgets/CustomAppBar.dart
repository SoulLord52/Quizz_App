import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
        required this.title,
        this.actions = const [],
        this.isDark = false});
  final String title;
  final List<Widget> actions;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: isDark == true ? Color(0XFF101622) : Colors.white,
      centerTitle: true,
      actions: actions,
      title: Image.asset(
        title,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight.toDouble());
}