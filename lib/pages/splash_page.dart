import 'package:flutter/material.dart';

import '../widgets/empty_state.dart';

class SplashPage extends StatelessWidget {
  final String title;

  const SplashPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyState(
          title: title,
          child: const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
