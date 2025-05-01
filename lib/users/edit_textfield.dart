import 'package:flutter/material.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.isPassword,
    required this.title,
  });

  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool isPassword;
  final String title;

  @override
  State<EditProfileWidget> createState() => _EditProfileWidget();
}

class _EditProfileWidget extends State<EditProfileWidget> {
  bool showpass = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? showpass : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.amber.shade50,
            prefixIcon: Icon(widget.prefixIcon, color: Colors.amber.shade600),
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                      icon: Icon(
                        showpass ? Icons.visibility : Icons.visibility_off,
                        color: Colors.amber.shade600,
                      ),
                    )
                    : null,
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}
