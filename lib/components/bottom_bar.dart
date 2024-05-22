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
    return SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Добавлено это
          selectedItemColor: Theme.of(context).colorScheme.tertiary,
          unselectedItemColor: Theme.of(context).colorScheme.onTertiary,
          currentIndex: _selectedIndex,
          onTap: changePage,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.bookmark,
                size: 40,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.format_list_bulleted_sharp,
                size: 40,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.school,
                size: 40,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.settings,
                size: 40,
              ),
            ),
          ],
        ));
  }
}
