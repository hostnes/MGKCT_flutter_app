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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
        ),
        margin: const EdgeInsets.all(10),
        width: 292,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                Icon(
                  Icons.group,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(width: 20),
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
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 10),
                Icon(
                  Icons.computer,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(width: 20),
                Text(
                  cabinet,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13.0,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
