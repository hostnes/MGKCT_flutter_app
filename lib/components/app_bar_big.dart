import 'package:flutter/material.dart';

class AppBarBig extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarBig({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(126.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Transform.rotate(
          angle: 180 * 3.1415926535 / 180, //перевернуть
          child: Icon(Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 126.0,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: 'Inter',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
