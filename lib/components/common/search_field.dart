import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final void Function(String) onChangeField;

  const SearchField({super.key, required this.onChangeField});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChangeField(value),
      decoration: InputDecoration(
        hintText: 'Поиск',
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
