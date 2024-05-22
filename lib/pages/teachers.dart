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
    if (_teachers.isEmpty) {
      return const AwaitDataPage();
    } else {
      return Scaffold(
        appBar: const SearchAppBar(title: 'Select Teacher'),
        body: Container(
          margin: const EdgeInsets.all(7),
          child: ListView.builder(
            itemCount: _teachers.length,
            itemBuilder: (context, index) {
              return TeacherWidget(
                teacher: _teachers[index],
              );
            },
          ),
        ),
        bottomNavigationBar: BottomBar(),
      );
    }
  }
}
