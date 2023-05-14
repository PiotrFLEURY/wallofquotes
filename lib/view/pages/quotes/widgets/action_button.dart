import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.count,
    required this.onPressed,
  });

  final IconData icon;
  final int count;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          onPressed: onPressed,
        ),
        Text(
          '$count',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
