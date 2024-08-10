import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String title;

  final Widget child;

  const EmptyState({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/cat.png',
            width: 96,
            height: 96,
          ),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}
