import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Icon(
              Icons.bookmark,
              size: 45,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(
              Icons.format_list_bulleted_sharp,
              size: 45,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(
              Icons.school,
              size: 45,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(
              color: Theme.of(context).colorScheme.secondary,
              Icons.settings,
              size: 45,
            ),
          ),
        ),
      ],
    );
  }
}
