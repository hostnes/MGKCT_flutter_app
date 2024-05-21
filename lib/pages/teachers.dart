import 'package:flutter/material.dart';
import 'package:work/api/api.dart';
import 'package:work/components/app_bar.dart';
import 'package:work/components/bottom_bar.dart';
import 'package:work/components/teacher_widget.dart';
import 'package:work/pages/await_data_page.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  List<Map<String, dynamic>> _teachers = [];

  Future<void> _fetchTeachers() async {
    var data = await ConnectServer.getTeachers();
    setState(() {
      _teachers = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchTeachers();
  }

  @override
  Widget build(BuildContext context) {
    if (_teachers.isNotEmpty) {
      return Scaffold(
        appBar: SearchAppBar(title: 'Select Teacher'),
        body: Expanded(
          child: ListView.builder(
            itemCount: _teachers.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(123);
                },
                child: TeacherWidget(
                  teacher: _teachers[index],
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomBar(),
      );
    } else {
      return const AwaitDataPage();
    }
  }
}
