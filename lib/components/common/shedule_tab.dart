import 'package:flutter/material.dart';

class ScheduleTab extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isSelected;

  ScheduleTab({super.key, required this.data, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 50,
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.onPrimary,
            ),
            child: Center(
              child: Text(
                data["day"].toString().split(".").first,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          Text(
            data["week_day"].substring(0, 3),
            style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.onPrimary),
          )
        ],
      ),
    );
  }
}
