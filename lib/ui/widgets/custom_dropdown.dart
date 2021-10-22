import 'package:flutter/material.dart';

import '../app_ui.dart';

class CustomDropdown extends StatefulWidget {
  final String? label;

  final String? value;

  // ignore: prefer_typing_uninitialized_variables
  final onChanged;

  final List<String> items;

  const CustomDropdown({
    Key? key,
    this.label,
    this.value,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8.0),
        errorStyle: const TextStyle(color: Colors.redAccent),
        label: (widget.label != null)
            ? Text(
                widget.label!,
                style: const TextStyle(color: primaryColor),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          iconEnabledColor: primaryColor,
          borderRadius: BorderRadius.circular(5.0),
          value: widget.value,
          items: _items(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _items() {
    List<DropdownMenuItem<String>> items = [];
    for (String item in widget.items) {
      items.add(
        DropdownMenuItem(
          child: Text(
            item.toUpperCase(),
            style: const TextStyle(
              color: primaryColor,
            ),
          ),
          value: item,
        ),
      );
    }
    return items;
  }
}
