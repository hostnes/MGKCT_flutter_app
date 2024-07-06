import 'package:flutter/material.dart';

class SheduleAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String mounth;
  final String day;
  final String name;
  const SheduleAppBar(
      {super.key, required this.day, required this.mounth, required this.name});

  @override
  State<SheduleAppBar> createState() => _SheduleAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(56.0); // Переносим сюда
}

class _SheduleAppBarState extends State<SheduleAppBar> {
  Map mounths = {
    "01": "Январь",
    "02": "Февраль",
    "03": "Март",
    "04": "Апрель",
    "05": "Май",
    "06": "Июнь",
    "07": "Июль",
    "08": "Август",
    "09": "Сентябрь",
    "10": "Октябрь",
    "11": "Ноябрь",
    "12": "Декабрь",
  };
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Transform.rotate(
          angle: 180 * 3.1415926535 / 180,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                mounths[widget.mounth],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
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
          Row(
            children: [
              Text(
                widget.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          )
        ],
      ),
    );
  }
}
