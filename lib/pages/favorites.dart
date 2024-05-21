import 'package:flutter/material.dart';
import 'package:work/components/app_bar.dart';
import 'package:work/components/bottom_bar.dart';

class FavorietsPage extends StatelessWidget {
  const FavorietsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchAppBar(title: 'Favoriets'),
      bottomNavigationBar: BottomBar(),
    );
  }
}
