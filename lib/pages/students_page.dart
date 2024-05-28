import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:work/api/api.dart';
import 'package:work/components/common/search_app_bar.dart';
import 'package:work/components/common/bottom_bar.dart';
import 'package:work/components/students/student_widget.dart';
import 'package:work/components/common/search_field.dart';
import 'package:work/pages/await_data_page.dart';
import 'package:work/themes/themes_provider.dart';

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
        appBar: const SearchAppBar(title: 'Выберите группу'),
        body: Container(
          margin: const EdgeInsets.all(7),
          child: ListView.builder(
            itemCount: _groups.length,
            itemBuilder: (context, index) {
              return StudentsWidget(
                number: _groups[index],
              );
            },
          ),
        ),
        bottomNavigationBar: const BottomBar(selectedIndex: 2),
      );
    }
  }
}
