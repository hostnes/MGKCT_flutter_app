import 'package:flutter/material.dart';
import 'package:work/api/api.dart';
import 'package:work/components/bottom_bar.dart';
import 'package:work/components/shedule_app_bar.dart';
import 'package:work/components/shedule_tab.dart';
import 'package:work/pages/await_data_page.dart';

class SchedulePage extends StatefulWidget {
  final String groupNumber;
  const SchedulePage({super.key, required this.groupNumber});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  List<ScheduleTab> tabList = [];

  int count = 0;
  List<dynamic> weekData = [];
  late TabController tabController;

  Future<void> _fetchSheduleData() async {
    var data = await ConnectServer.getWeekDayData(widget.groupNumber);
    setState(() {
      weekData = data;
      tabController = TabController(length: weekData.length, vsync: this);
      tabController.addListener(_buildCategoryTabs);
      _buildCategoryTabs();
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: weekData.length, vsync: this);
    _fetchSheduleData();
  }

  @override
  void dispose() {
    tabController.removeListener(_buildCategoryTabs);
    tabController.dispose();
    super.dispose();
  }

  void _buildCategoryTabs() {
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
  }

  @override
  Widget build(BuildContext context) {
    if (weekData.isEmpty) {
      return const AwaitDataPage();
    } else {
      return Scaffold(
        appBar: SheduleAppBar(
          mounth: "Апрель",
          day: "Сегодня",
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
                  return Center(
                      child: Text('Content for ${day["info"]["day"]}'));
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
