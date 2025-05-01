import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onAdd;

  const Buttons({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade300,
              foregroundColor: Colors.black,
              fixedSize: const Size(250, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Cancel"),
          ),
        ),
        const Gap(12),
        Expanded(
          child: ElevatedButton(
            onPressed: onAdd,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade300,
              foregroundColor: Colors.black,
              fixedSize: const Size(250, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Add"),
          ),
        ),
      ],
    );
  }
}
