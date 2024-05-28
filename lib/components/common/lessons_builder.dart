import 'package:flutter/material.dart';
import 'package:work/components/students/students_lessons_decoration.dart';
import 'package:work/components/teacher/teacher_lessons_decoration.dart';

class LessonsBuilder extends StatelessWidget {
  final Map<String, dynamic> lessons;
  final bool isTeacher;
  const LessonsBuilder(
      {super.key, required this.lessons, required this.isTeacher});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons['lessons'].length,
      itemBuilder: (context, index) {
        final lesson = lessons['lessons'][index];
        if (isTeacher == true) {
          return TeachersLessonsDecoration(
            lessons: lesson['number_lesson'].toString(),
            title: lesson['title'].toString(),
            cabinet: lesson['cabinet'].toString(),
            group: lesson['group'].toString(),
          );
        } else {
          return StudentsLessonsDecoration(
            lessons: lesson['number_lesson'].toString(),
            title: lesson['title'].toString(),
            cabinet: lesson['cabinet'].toString(),
          );
        }
      },
    );
  }
}
