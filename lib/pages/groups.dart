import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work/components/bottom_bar.dart';
import 'package:work/components/group_widget.dart';
import 'package:work/components/search_field.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<Map<String, dynamic>> groupList = [
    {'id': 1, 'info': '67МНЭ'},
    {'id': 2, 'info': '68МС'},
    {'id': 3, 'info': '69ТП'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 126.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Выберите группу',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: 'Inter',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: SearchField(),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
              itemCount: groupList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(123);
                  },
                  child: GroupWidget(
                    number: groupList[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
