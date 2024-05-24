import 'package:flutter/material.dart';

class AppBarSmall extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarSmall({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(68.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 68.0,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontFamily: 'Inter',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          // textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
