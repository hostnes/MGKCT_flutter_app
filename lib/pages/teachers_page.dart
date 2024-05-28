import 'package:flutter/material.dart';
import 'package:work/api/api.dart';
import 'package:work/components/common/search_app_bar.dart';
import 'package:work/components/common/bottom_bar.dart';
import 'package:work/components/teacher/teacher_widget.dart';
import 'package:work/pages/await_data_page.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  List<Map<String, dynamic>> _teachers = [];
  List<Map<String, dynamic>> trueTeachers = [];

  Future<void> _fetchTeachers() async {
    var data = await ConnectServer.getTeachers();
    setState(() {
      _teachers = data;
      trueTeachers = _teachers;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchTeachers();
  }

  void onChangeField(String value) {
    List<Map<String, dynamic>> localTeachers = [];
    _teachers.forEach((teacher) {
      if (teacher['name'].toLowerCase().contains(value.toLowerCase())) {
        localTeachers.add(teacher);
      }
    });
    setState(() {
      trueTeachers = localTeachers;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_teachers.isEmpty) {
      return const AwaitDataPage();
    } else {
      return Scaffold(
        appBar: SearchAppBar(
            title: 'Выберите преподавателя', onChangeField: onChangeField),
        body: Container(
          margin: const EdgeInsets.all(7),
          child: ListView.builder(
            itemCount: trueTeachers.length,
            itemBuilder: (context, index) {
              return TeacherWidget(
                teacher: trueTeachers[index],
              );
            },
          ),
        ),
        bottomNavigationBar: const BottomBar(selectedIndex: 1),
      );
    }
  }
}
