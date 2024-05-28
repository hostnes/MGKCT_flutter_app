import 'package:flutter/material.dart';
import 'package:work/components/common/default_app_bar.dart';
import 'package:work/components/common/bottom_bar.dart';
import 'package:work/components/common/change_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Настройки'),
      body: Container(
        margin: const EdgeInsets.all(7),
        child: const ChangeTheme(),
      ),
      bottomNavigationBar: const BottomBar(selectedIndex: 3),
    );
  }
}
