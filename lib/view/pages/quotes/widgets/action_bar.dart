import 'package:flutter/material.dart';
import 'package:wallofquotes/view/pages/quotes/widgets/action_button.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({
    super.key,
    required this.fireCount,
    required this.likeCount,
    required this.dislikeCount,
    required this.reportCount,
    required this.onFirePressed,
    required this.onLikePressed,
    required this.onDislikePressed,
    required this.onReportPressed,
  });

  final int fireCount;
  final int likeCount;
  final int dislikeCount;
  final int reportCount;

  final VoidCallback onFirePressed;
  final VoidCallback onLikePressed;
  final VoidCallback onDislikePressed;
  final VoidCallback onReportPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionButton(
            icon: Icons.local_fire_department_outlined,
            count: fireCount,
            onPressed: onFirePressed,
          ),
          ActionButton(
            icon: Icons.favorite_border,
            count: likeCount,
            onPressed: onLikePressed,
          ),
          ActionButton(
            icon: Icons.thumb_down_alt_outlined,
            count: dislikeCount,
            onPressed: onDislikePressed,
          ),
          ActionButton(
            icon: Icons.new_releases_outlined,
            count: reportCount,
            onPressed: onReportPressed,
          ),
        ],
      ),
    );
  }
}
