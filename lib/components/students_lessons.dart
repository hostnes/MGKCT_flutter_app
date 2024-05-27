import 'package:flutter/material.dart';

class StudentsLessons extends StatelessWidget {
  final Map<String, dynamic> lessons;

  const StudentsLessons({super.key, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons['lessons'].length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            lessons["lessons"][index].toString(),
          ),
        );
      },
    );
  }
}
/*import 'package:flutter/material.dart';

class StudentsLessons extends StatelessWidget {
  final Map<String, dynamic> lessons;
  const StudentsLessons({super.key, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(lessons.toString()));
  }
}*/

/*import 'package:flutter/material.dart';

class StudentsLessons extends StatelessWidget {
  final Map<String, dynamic> lessons;
  
  const StudentsLessons({Key key, required this.lessons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: lessons.entries.map((entry) {
        final lesson = entry.value[0];
        return ListTile(
          key: ValueKey('${lesson['number_lesson']}'), 
          title: Text('Number Lesson: ${lesson['number_lesson']}'),
          subtitle: Text('Title: ${lesson['title']}'),
        );
      }).toList(),
    );
  }
}*/
/*{
  "info": {
    "day": 20.02.2006",
    week_day" : "пятница"
  },
  "lessons":{
    "160": [
      {
      "number_lesson": "1",
      "title": "ляляляляля",
      "cabinet": "ggggg"
      }
    ]
     "161": [
      {
      "number_lesson": "2",
      "title": "jhnb",
      "cabinet": "jh"
      }
    ]
  }
}
*/