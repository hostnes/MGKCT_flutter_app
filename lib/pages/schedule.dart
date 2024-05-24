import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work/components/app_bar_big.dart';
import 'package:work/components/bottom_bar.dart';
import 'package:work/components/change_theme.dart';

class SchedulePage extends StatelessWidget {
  final String groupNumber;

  const SchedulePage({Key? key, required this.groupNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBig(title: 'Какашка'),
      body: Center(
        child: Text(groupNumber),
      ),
      bottomNavigationBar: const BottomBar(selectedIndex: 2),
    );
  }
}
