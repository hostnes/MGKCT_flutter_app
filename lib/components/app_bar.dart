import 'package:flutter/material.dart';
import 'package:work/components/search_field.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const SearchAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(126.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 126.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
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
    );
  }
}
