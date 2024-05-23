import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:work/components/app_bar.dart';
import 'package:work/components/bottom_bar.dart';
import 'package:work/components/group_widget.dart';
import 'package:work/components/teacher_widget.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(title: 'Favoriets'),
      bottomNavigationBar: const BottomBar(selectedIndex: 0),
      body: Container(
        margin: const EdgeInsets.all(7),
        child: ListView.builder(
          itemCount: _boxLenght,
          itemBuilder: (context, index) {
            if (_boxTeachers.isNotEmpty && isTeacherTitle) {
              isTeacherTitle = false;
              plusIndex += 1;
              return Text("Преподователи");
            }
            if (_boxElements[index - plusIndex].runtimeType == String) {
              if (_boxGroups.isNotEmpty && isGroupTitle) {
                isGroupTitle = false;
                plusIndex += 1;
                return Text("Группы");
              }
              return GroupWidget(
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
