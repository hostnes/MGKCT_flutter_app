import 'package:flutter/material.dart';
import 'package:work/api/api.dart';
import 'package:work/components/bottom_bar.dart';
import 'package:work/components/shedule_app_bar.dart';
import 'package:work/components/shedule_tab.dart';
import 'package:work/components/students_lessons.dart';
import 'package:work/pages/await_data_page.dart';
import 'package:work/components/lessons_decoration.dart';

class SchedulePage extends StatefulWidget {
  final String groupNumber;
  const SchedulePage({super.key, required this.groupNumber});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

Map mounths = {
  "01": "Январь",
  "02": "Февраль",
  "03": "Март",
  "04": "Апрель",
  "05": "Май",
  "06": "Июнь",
  "07": "Июль",
  "08": "Август",
  "09": "Сентябрь",
  "10": "Октябрь",
  "11": "Ноябрь",
  "12": "Декабрь",
};

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  List<ScheduleTab> tabList = [];
  String dayToday = "завтра";
  List<dynamic> weekData = [];
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: weekData.length, vsync: this);
    _fetchSheduleData();
  }

  @override
  void dispose() {
    tabController.removeListener(_buildTabs);
    tabController.dispose();
    super.dispose();
  }

  Future<void> _fetchSheduleData() async {
    var data = await ConnectServer.getWeekDayData(widget.groupNumber);
    setState(() {
      weekData = data[widget.groupNumber];
      tabController = TabController(length: weekData.length, vsync: this);
      tabController.addListener(_buildTabs);
      _buildTabs();
    });
  }

  void _buildTabs() {
    setState(() {
      tabList = weekData.asMap().entries.map((entry) {
        int idx = entry.key;
        var day = entry.value;
        bool isSelected = tabController.index == idx;
        return ScheduleTab(
          data: day["info"],
          isSelected: isSelected,
        );
      }).toList();
    });
    _calculateDayToday();
  }

  void _calculateDayToday() {
    DateTime now = DateTime.now();
    int day = now.day;
    int count = 0;
    var indexToday;
    for (var item in weekData) {
      if (item['info']["day"].toString().split(".")[0] == day.toString()) {
        indexToday = count;
      }
      count++;
    }

    if (indexToday == tabController.index) {
      setState(() {
        dayToday = "Сегодня";
      });
    } else if (indexToday + 1 == tabController.index) {
      setState(() {
        dayToday = "Завтра";
      });
    } else if (indexToday - 1 == tabController.index) {
      setState(() {
        dayToday = "Вчера";
      });
    } else {
      setState(() {
        dayToday = weekData[tabController.index]['info']["day"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (weekData.isEmpty) {
      return const AwaitDataPage();
    } else {
      return Scaffold(
        appBar: SheduleAppBar(
          mounth: weekData[0]['info']['day'].toString().split(".")[1],
          day: dayToday,
        ),
        body: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.only(bottom: 7),
              child: TabBar(
                unselectedLabelColor: Colors.amber,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                controller: tabController,
                tabs: tabList,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: weekData.map((day) {
                  return StudentsLessons(
                    lessons: day,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomBar(selectedIndex: 2),
      );
    }
  }
}
