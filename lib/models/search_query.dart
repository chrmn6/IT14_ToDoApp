import 'package:flutter/material.dart';

class TaskSearchBox extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const TaskSearchBox({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.deepPurple.shade50,
        hintText: 'Search your tasks',
        hintStyle: TextStyle(color: Colors.grey.shade700),
        prefixIcon: Icon(Icons.search, color: Colors.deepPurple.shade600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.deepPurple.shade300, width: 2),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
