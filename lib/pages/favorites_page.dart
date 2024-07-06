import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_widget/home_widget.dart';
import 'package:work/components/common/default_app_bar.dart';
import 'package:work/components/common/search_app_bar.dart';
import 'package:work/components/common/bottom_bar.dart';
import 'package:work/components/students/student_widget.dart';
import 'package:work/components/teacher/teacher_widget.dart';

class FavorietsPage extends StatefulWidget {
  const FavorietsPage({super.key});

  @override
  State<FavorietsPage> createState() => _FavorietsPageState();
}

class _FavorietsPageState extends State<FavorietsPage> {
  List _boxGroups = [];
  List _boxTeachers = [];
  List _boxElements = [];
  int _boxLenght = 0;
  bool isTeacherTitle = true;
  bool isGroupTitle = true;
  int plusIndex = 0;

  String appGroupId = "group.flutter_day_widget_group";
  String iOSWidgetName = "day_shedule_widget";

  var box = Hive.box('userInfo');

  void calculayeLenght() {
    _boxLenght += _boxGroups.length;
    _boxLenght += _boxTeachers.length;
    if (_boxGroups.isNotEmpty) {
      _boxLenght += 1;
    }
    if (_boxTeachers.isNotEmpty) {
      _boxLenght += 1;
    }
  }

  @override
  void initState() {
    _boxTeachers = box.get('teachers', defaultValue: []);
    _boxGroups = box.get('groups', defaultValue: []);
    _boxElements = _boxTeachers + _boxGroups;
    calculayeLenght();
    super.initState();
    HomeWidget.setAppGroupId(appGroupId);
    HomeWidget.saveWidgetData("title", "i love ssvetochka");
    HomeWidget.saveWidgetData("description", "so much");
    HomeWidget.updateWidget(iOSName: iOSWidgetName);
  }

  @override
  Widget build(BuildContext context) {
    if (_boxElements.length == 0) {
      return Scaffold(
        appBar: const DefaultAppBar(title: 'Избранное'),
        bottomNavigationBar: const BottomBar(selectedIndex: 0),
        body: Center(
          child: Text("У вас пока нету избранных элементов"),
        ),
      );
    } else {
      return Scaffold(
        appBar: const DefaultAppBar(title: 'Избранное'),
        bottomNavigationBar: const BottomBar(selectedIndex: 0),
        body: Container(
          margin: const EdgeInsets.all(7),
          child: ListView.builder(
            itemCount: _boxLenght,
            itemBuilder: (context, index) {
              if (_boxTeachers.isNotEmpty && isTeacherTitle) {
                isTeacherTitle = false;
                plusIndex += 1;
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Center(
                    child: Text(
                      "Преподователи",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }
              if (_boxElements[index - plusIndex].runtimeType == String) {
                if (_boxGroups.isNotEmpty && isGroupTitle) {
                  isGroupTitle = false;
                  plusIndex += 1;
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Center(
                      child: Text(
                        "Группы",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
                return StudentsWidget(
                  number: _boxElements[index - plusIndex],
                );
              } else {
                return TeacherWidget(
                  teacher: _boxElements[index - plusIndex],
                );
              }
            },
          ),
        ),
      );
    }
  }
}
