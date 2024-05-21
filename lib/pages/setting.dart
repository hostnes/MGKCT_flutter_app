import 'package:flutter/material.dart';
import 'package:work/components/app_bar.dart';
import 'package:work/components/bottom_bar.dart';
import 'package:work/components/change_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchAppBar(title: 'Settings'),
      body: ChangeTheme(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
