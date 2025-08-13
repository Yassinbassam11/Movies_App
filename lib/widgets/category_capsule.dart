import 'package:flutter/material.dart';

class CategoryCapsule extends StatelessWidget {
  const CategoryCapsule({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? Theme.of(context).colorScheme.surface
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: isDarkMode
              ? Theme.of(context).colorScheme.outline.withOpacity(0.3)
              : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDarkMode
                ? Theme.of(context).colorScheme.onSurface
                : Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
