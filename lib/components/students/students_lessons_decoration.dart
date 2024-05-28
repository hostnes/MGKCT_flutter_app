import 'package:flutter/material.dart';
import 'package:work/components/common/lessons_builder.dart';

class StudentsLessonsDecoration extends StatelessWidget {
  final String lessons;
  final String title;
  final String cabinet;

  const StudentsLessonsDecoration({
    super.key,
    required this.lessons,
    required this.title,
    required this.cabinet,
  });

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
            const SizedBox(height: 10),
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
