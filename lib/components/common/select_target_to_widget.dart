import 'package:flutter/material.dart';
import 'package:work/api/api.dart';

class GroupSelector extends StatefulWidget {
  @override
  _GroupSelectorState createState() => _GroupSelectorState();
}

class _GroupSelectorState extends State<GroupSelector> {
  List<String> trueGroups = [];
  String selectedGroup = '1';

  Future<void> _fetchGroups() async {
    var data = await ConnectServer.getGroups();
    setState(() {
      trueGroups = data;
    });
  }

  @override
  void initState() {
    _fetchGroups();

    super.initState();
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
          Container(
            padding: EdgeInsets.fromLTRB(12, 2, 6, 0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedGroup,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 34,
                elevation: 16,
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGroup = newValue!;
                  });
                },
                items: <String>['1', '2', '3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
