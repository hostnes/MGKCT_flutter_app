import 'package:flutter/material.dart';
import 'package:work/pages/favorites.dart';
import 'package:work/pages/groups.dart';
import 'package:work/pages/setting.dart';
import 'package:work/pages/teachers.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FavorietsPage(),
          ),
        );

      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TeachersPage(),
          ),
        );
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GroupsPage(),
          ),
        );
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingsPage(),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).colorScheme.tertiary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      currentIndex: _selectedIndex,
      onTap: changePage,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
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
