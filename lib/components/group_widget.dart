import 'package:flutter/material.dart';

class GroupWidget extends StatelessWidget {
  final String number;

  GroupWidget({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            number,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 22,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: Theme.of(context).colorScheme.inversePrimary,
          )
        ],
      ),
    );
  }
}
