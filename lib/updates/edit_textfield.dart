import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/models/app_style.dart';

class EditTextFieldWidget extends StatelessWidget {
  const EditTextFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines,
    this.readOnly = false,
    this.controller,
  });

  final String title;
  final String hintText;
  final int? maxLines;
  final bool readOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: AppStyle.headingOne),
        Gap(5),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.deepPurple.shade50,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            ),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
