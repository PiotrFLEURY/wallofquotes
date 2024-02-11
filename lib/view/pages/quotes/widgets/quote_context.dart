import 'package:flutter/material.dart';

class QuoteContext extends StatefulWidget {
  const QuoteContext({
    super.key,
    required this.label,
  });

  final String label;

  @override
  State<QuoteContext> createState() => _QuoteContextState();
}

class _QuoteContextState extends State<QuoteContext> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleVisibility,
      child: Container(
        decoration: visible
            ? null
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
        padding: const EdgeInsets.all(16),
        child: Text(
          visible ? widget.label : 'Afficher le contexte',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }

  void _toggleVisibility() {
    setState(() {
      visible = !visible;
    });
  }
}
