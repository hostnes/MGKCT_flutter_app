import 'package:flutter/material.dart';

class GroupWidget extends StatelessWidget {
  final Map<String, dynamic> number;

  GroupWidget({required this.number});

  @override
  Widget build(BuildContext context) {
    print(number);
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            number['info'] ?? 'N/A',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 22,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 24, color: Colors.black)
        ],
      ),
    );
  }
}
