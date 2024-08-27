import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = 'English';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 100.0,
      child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(
            Icons.check,
            color: Colors.indigo[500],
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: null,
          ),
          dropdownColor: Colors.white,
          items: <String>['English', 'Français', 'Deutsch', 'Español']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
              ),
            );
          }).toList(),
          onChanged: (String? newLanguage) {
            setState(() {
              dropdownValue = newLanguage;
            });
          }),
    );
  }
}
