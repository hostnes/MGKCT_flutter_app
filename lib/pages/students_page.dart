import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:work/api/api.dart';
import 'package:work/components/common/search_app_bar.dart';
import 'package:work/components/common/bottom_bar.dart';
import 'package:work/components/students/student_widget.dart';
import 'package:work/pages/await_data_page.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});
  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<String> _groups = [];
  List<String> trueGroups = [];
  Future<void> _fetchGroups() async {
    var data = await ConnectServer.getGroups();
    setState(() {
      _groups = data;
      trueGroups = _groups;
    });
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
    if (_groups.isEmpty) {
      return const AwaitDataPage();
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: SearchAppBar(
            title: 'Выберите группу', onChangeField: onChangeField),
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
