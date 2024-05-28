import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:work/pages/student_schedule_page.dart';

class StudentsWidget extends StatefulWidget {
  final String number;

  StudentsWidget({required this.number});

  @override
  State<StudentsWidget> createState() => _StudentsWidgetState();
}

class _StudentsWidgetState extends State<StudentsWidget>
    with SingleTickerProviderStateMixin {
  List _boxGroups = [];
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
    _boxGroups = box.get('groups', defaultValue: []);
    for (var e in _boxGroups) {
      if (e.toString() == widget.number) {
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

      if (isStarred == true) {
        _boxGroups.add(widget.number);
      } else {
        _boxGroups.remove(widget.number);
      }
      box.put("groups", _boxGroups.toList());
    }

    _animationController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String number = widget.number;
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    StudentSchedulePage(groupNumber: widget.number),
              ),
            );
          },
          onHorizontalDragUpdate: (details) =>
              _handleDragUpdate(details, constraints),
          onHorizontalDragEnd: (details) => _handleDragEnd(),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(7),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                alignment: Alignment.centerLeft,
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.number,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 22,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
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
    );
  }
}
