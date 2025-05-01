import 'package:flutter/material.dart';

class SubDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;

  const SubDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 32),
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).hintColor,
        size: 25,
      ),
      title: Text(title, style: TextStyle(fontSize: 14)),
      onTap: onTap,
    );
  }
}
