import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work/api/api.dart';
import 'package:work/components/app_bar.dart';
import 'package:work/components/bottom_bar.dart';
import 'package:work/components/group_widget.dart';
import 'package:work/components/search_field.dart';
import 'package:work/pages/await_data_page.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<String> _groups = [];

  Future<void> _fetchGroups() async {
    var data = await ConnectServer.getGroups();
    setState(() {
      _groups = data;
    });
  }

  List<Map<String, dynamic>> groupList = [
    {'id': 1, 'info': '67МНЭ'},
    {'id': 2, 'info': '68МС'},
    {'id': 3, 'info': '69ТП'},
  ];

  @override
  void initState() {
    super.initState();
    _fetchGroups();
  }

  @override
  Widget build(BuildContext context) {
    if (_groups.isEmpty) {
      return const AwaitDataPage();
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: SearchAppBar(title: 'Select Group'),
        body: Column(
          children: [
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: _groups.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(123);
                    },
                    child: GroupWidget(
                      number: _groups[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomBar(),
      );
    }
  }
}
