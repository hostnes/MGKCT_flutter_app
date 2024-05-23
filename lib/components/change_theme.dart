import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work/themes/themes_provider.dart';
import 'package:provider/provider.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Dark Mode",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
          ),
          CupertinoSwitch(
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              })
        ],
      ),
    );
  }
}
