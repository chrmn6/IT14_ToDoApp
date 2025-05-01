import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: selected ? Colors.amber.shade300 : Colors.grey.shade900,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: selected ? Colors.amber.shade300 : Colors.grey.shade900,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
      selected: selected,
    );
  }
}
