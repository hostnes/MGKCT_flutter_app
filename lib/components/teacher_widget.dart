import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:work/models/teacher.dart';

class TeacherWidget extends StatefulWidget {
  final Map<dynamic, dynamic> teacher;
  const TeacherWidget({super.key, required this.teacher});

  @override
  _TeacherWidgetState createState() => _TeacherWidgetState();
}

class _TeacherWidgetState extends State<TeacherWidget>
    with SingleTickerProviderStateMixin {
  List _boxTeachers = [];

  late AnimationController _animationController;
  bool isStarred = false;
  var box = Hive.box('userInfo');

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _boxTeachers = box.get('teachers', defaultValue: []);
    for (var e in _boxTeachers) {
      if (e.toString() == widget.teacher.toString()) {
        isStarred = true;
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragUpdate(
      DragUpdateDetails details, BoxConstraints constraints) {
    double dragAmount = details.primaryDelta! / constraints.maxWidth;
    _animationController.value += dragAmount;
  }

  void _handleDragEnd() {
    if (_animationController.value >= 0.25) {
      setState(() {
        isStarred = !isStarred;
      });
      var index = 0;
      _boxTeachers.map((e) {
        index++;
      });
      if (isStarred == true) {
        _boxTeachers.add(widget.teacher);
      } else {
        _boxTeachers.removeAt(index);
      }
      box.put("teachers", _boxTeachers.toList());
    }

    _animationController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(123);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onHorizontalDragUpdate: (details) =>
                _handleDragUpdate(details, constraints),
            onHorizontalDragEnd: (details) => _handleDragEnd(),
            child: Stack(
              children: [
                Container(
                  height: 65,
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    isStarred ? Icons.star : Icons.star_border,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          _animationController.value * constraints.maxWidth, 0),
                      child: child,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.network(widget.teacher['img_path'],
                              height: 55, width: 55, fit: BoxFit.cover),
                        ),
                        Container(
                          height: 30,
                          width: 180,
                          child: Marquee(
                            text: widget.teacher['name'],
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                            ),
                            scrollAxis: Axis.horizontal,
                            blankSpace: 20.0,
                            velocity: 30.0,
                            pauseAfterRound: const Duration(seconds: 1),
                            startPadding: 10.0,
                            accelerationDuration: const Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration:
                                const Duration(milliseconds: 500),
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
