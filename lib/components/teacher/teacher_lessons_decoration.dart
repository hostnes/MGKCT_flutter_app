import 'package:flutter/material.dart';

class TeachersLessonsDecoration extends StatelessWidget {
  final String lessons;
  final String title;
  final String cabinet;
  final String group;
  const TeachersLessonsDecoration(
      {super.key,
      required this.lessons,
      required this.title,
      required this.cabinet,
      required this.group});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
        ),
        margin: const EdgeInsets.all(10),
        width: 292,
        height: 127,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lessons,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Text(
              cabinet,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13.0,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Text(
              group,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13.0,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
