import 'package:flutter/material.dart';

class SheduleAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String mounth;
  final String day;
  const SheduleAppBar({super.key, required this.day, required this.mounth});

  @override
  State<SheduleAppBar> createState() => _SheduleAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(56.0); // Переносим сюда
}

class _SheduleAppBarState extends State<SheduleAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Transform.rotate(
          angle: 180 * 3.1415926535 / 180, //перевернуть
          child: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Row(
        children: [
          Text(
            widget.mounth,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontFamily: 'Inter',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              widget.day,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
