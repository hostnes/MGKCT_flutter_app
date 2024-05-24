import 'package:flutter/material.dart';
import 'package:work/components/search_app_bar.dart';

class AwaitDataPage extends StatelessWidget {
  const AwaitDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
