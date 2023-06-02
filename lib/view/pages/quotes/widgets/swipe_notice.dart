import 'package:flutter/material.dart';

class SwipeNotice extends StatelessWidget {
  const SwipeNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: 3.14 * 1.5,
          child: const Icon(
            Icons.double_arrow_rounded,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        CircleAvatar(
          radius: 2,
          backgroundColor: Colors.white.withAlpha(150),
        ),
        const SizedBox(height: 4),
        CircleAvatar(
          radius: 2,
          backgroundColor: Colors.white.withAlpha(100),
        ),
        const SizedBox(height: 4),
        CircleAvatar(
          radius: 2,
          backgroundColor: Colors.white.withAlpha(50),
        ),
        const SizedBox(height: 4),
        Text(
          'Swipe to see more quotes',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white.withAlpha(100),
                fontSize: 10,
              ),
        ),
      ],
    );
  }
}
