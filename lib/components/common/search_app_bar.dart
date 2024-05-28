import 'package:flutter/material.dart';
import 'package:work/components/common/search_field.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function(String) onChangeField;

  const SearchAppBar(
      {super.key, required this.title, required this.onChangeField});

  @override
  Size get preferredSize => const Size.fromHeight(126.0);

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
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: SearchField(
              onChangeField: onChangeField,
            ),
          ),
        ],
      ),
    );
  }
}
