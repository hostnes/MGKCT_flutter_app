import 'dart:async';
import 'package:flutter/material.dart';
import 'package:work/api/api.dart';
import 'package:work/components/common/search_app_bar.dart';
import 'package:work/components/common/bottom_bar.dart';
import 'package:work/components/teacher/teacher_widget.dart';
import 'package:work/pages/await_data_page.dart';
import 'package:work/pages/network_error_page.dart'; 

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  List<Map<String, dynamic>> _teachers = [];
  List<Map<String, dynamic>> trueTeachers = [];
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  Future<void> _fetchTeachers() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      // Таймер для контроля времени ожидания
      var timeout = const Duration(seconds: 10);
      var response = await ConnectServer.getTeachers().timeout(timeout, onTimeout: () {
        throw TimeoutException('Превышено время ожидания.');
      });

      setState(() {
        _teachers = response;
        trueTeachers = _teachers;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = e is TimeoutException
            ? 'Превышено время ожидания. Попробуйте еще раз.'
            : 'Ошибка загрузки данных. Попробуйте еще раз.';
      });
    }
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
    if (_isLoading) {
      return const AwaitDataPage();
    } else if (_hasError) {
      // Используем ErrorPage при возникновении ошибки
      return NetworkErrorPage(
        errorMessage: _errorMessage,
        onRetry: _fetchTeachers,
      );
    } else {
      return Scaffold(
        appBar: SearchAppBar(
          title: 'Выберите преподавателя',
          onChangeField: onChangeField,
        ),
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
