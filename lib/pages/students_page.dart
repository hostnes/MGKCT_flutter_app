import 'dart:async';
import 'package:flutter/material.dart';
import 'package:work/api/api.dart';
import 'package:work/components/common/search_app_bar.dart';
import 'package:work/components/common/bottom_bar.dart';
import 'package:work/components/students/student_widget.dart';
import 'package:work/pages/await_data_page.dart';
import 'package:work/pages/network_error_page.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<String> _groups = [];
  List<String> trueGroups = [];
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  Future<void> _fetchGroups() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      // Таймер для контроля времени ожидания
      var timeout = const Duration(seconds: 10);
      var response = await ConnectServer.getGroups().timeout(timeout, onTimeout: () {
        throw TimeoutException('Превышено время ожидания.');
      });

      setState(() {
        _groups = response;
        trueGroups = _groups;
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
    _fetchGroups();
  }

  void onChangeField(String value) {
    List<String> localGroups = [];
    _groups.forEach((group) {
      if (group.toLowerCase().contains(value.toLowerCase())) {
        localGroups.add(group);
      }
    });
    setState(() {
      trueGroups = localGroups;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const AwaitDataPage();
    } else if (_hasError) {
      return NetworkErrorPage(
        errorMessage: _errorMessage,
        onRetry: _fetchGroups,
      );
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: SearchAppBar(
          title: 'Выберите группу',
          onChangeField: onChangeField,
        ),
        body: Container(
          margin: const EdgeInsets.all(7),
          child: ListView.builder(
            itemCount: trueGroups.length,
            itemBuilder: (context, index) {
              return StudentsWidget(
                number: trueGroups[index],
              );
            },
          ),
        ),
        bottomNavigationBar: const BottomBar(selectedIndex: 2),
      );
    }
  }
}
