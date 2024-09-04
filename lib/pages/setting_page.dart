import 'package:flutter/material.dart';
import 'package:work/components/common/default_app_bar.dart';
import 'package:work/components/common/bottom_bar.dart';
import 'package:work/components/common/change_theme.dart';
import 'package:work/components/common/select_target_to_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Настройки'),
      body: Container(
        margin: const EdgeInsets.all(7),
        child: Column(
          children: [
            const ChangeTheme(),
            GroupSelector(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(selectedIndex: 3),
    );
  }
}
