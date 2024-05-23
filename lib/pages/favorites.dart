import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:work/components/app_bar.dart';
import 'package:work/components/bottom_bar.dart';

class FavorietsPage extends StatefulWidget {
  const FavorietsPage({super.key});

  @override
  State<FavorietsPage> createState() => _FavorietsPageState();
}

class _FavorietsPageState extends State<FavorietsPage> {
  List _boxGroups = [];
  List _boxTeachers = [];
  List _boxElements = [];
  var box = Hive.box('userInfo');

  @override
  void initState() {
    _boxTeachers = box.get('teachers', defaultValue: []);
    _boxGroups = box.get('groups', defaultValue: []);
    _boxElements = _boxTeachers + _boxGroups;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(title: 'Favoriets'),
      bottomNavigationBar: BottomBar(),
      body: Container(
        margin: const EdgeInsets.all(7),
        child: ListView.builder(
          itemCount: _boxElements.length,
          itemBuilder: (context, index) {
            print(_boxElements[index].runtimeType);

            return Text(_boxElements[index].toString());
          },
        ),
      ),
    );
  }
}
