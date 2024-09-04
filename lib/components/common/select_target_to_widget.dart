import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:work/api/api.dart';

class GroupSelector extends StatefulWidget {
  @override
  _GroupSelectorState createState() => _GroupSelectorState();
}

class _GroupSelectorState extends State<GroupSelector> {
  List<String> trueGroups = [];
  String selectedGroup = '1';
  var box = Hive.box('userInfo');

  @override
  void initState() {
    _fetchGroups();
    super.initState();
    selectedGroup = box.get("widgetTarget");
  }

  Future<void> _fetchGroups() async {
    var data = await ConnectServer.getGroups();
    setState(() {
      trueGroups = data;
    });
  }

  void _changeWidgetTarget(index) {
    setState(() {
      selectedGroup = trueGroups[index];
    });
    print(selectedGroup);
    box.put("widgetTarget", trueGroups[index]);
    Navigator.pop(context);
  }

  void _showGroupSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20)),
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary, width: 2),
          ),
          height: 350,
          child: ListView.builder(
            itemCount: trueGroups.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  trueGroups[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  _changeWidgetTarget(index);
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Группа для виджета',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: _showGroupSelection,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 4, 6, 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    selectedGroup,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
