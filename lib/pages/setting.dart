import 'package:flutter/material.dart';
import 'package:work/components/app_bar_small.dart';
import 'package:work/components/bottom_bar.dart';
import 'package:work/components/change_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarSmall(title: 'Settings'),
      body: Container(
        margin: const EdgeInsets.all(7),
        child: ChangeTheme(),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
