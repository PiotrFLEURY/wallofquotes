import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.count,
    this.onPressed,
    this.color = Colors.white,
  });

  final IconData icon;
  final int count;
  final VoidCallback? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: color,
          ),
          onPressed: onPressed,
        ),
        Text(
          '$count',
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  }
}
