import 'package:flutter/material.dart';
import 'package:work/components/lessons_decoration.dart';

class StudentsLessons extends StatelessWidget {
  final Map<String, dynamic> lessons;

  const StudentsLessons({super.key, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons['lessons'].length,
      itemBuilder: (context, index) {
        final lesson = lessons['lessons'][index];
        return LessonsDecoration(
          lessons: lesson['number_lesson'].toString(),
          title: lesson['title'].toString(),
          cabinet: lesson['cabinet'].toString(),
        );
      },
    );
  }
}
