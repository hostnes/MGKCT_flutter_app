import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class TeacherWidget extends StatelessWidget {
  final Map<String, dynamic> teacher;
  const TeacherWidget({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(teacher['img_path'],
                height: 60, width: 60, fit: BoxFit.cover),
          ),
          Container(
            height: 30, // Устанавливаем фиксированную высоту контейнера

            width: 180,
            child: Marquee(
              text: teacher['name'],
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 22,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 30.0,
              pauseAfterRound: Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: Theme.of(context).colorScheme.inversePrimary,
          )
        ],
      ),
    );
    ;
  }
}
