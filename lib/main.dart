import 'package:flutter/material.dart';
import 'package:work/themes/themes_provider.dart';
import 'package:provider/provider.dart';
import 'package:work/pages/groups.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const GroupsPage(),
    );
  }
}
