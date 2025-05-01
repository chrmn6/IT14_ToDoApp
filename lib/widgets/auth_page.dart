import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    required this.controller,
    required this.isPassword,
  });

  final String hintText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<AuthField> createState() => AuthFieldState();
}

class AuthFieldState extends State<AuthField> {
  bool showpass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? showpass : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.deepPurple.shade50,
        prefixIcon: Icon(widget.prefixIcon, color: Colors.deepPurple),
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
                    color: Colors.deepPurple,
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
    );
  }
}
