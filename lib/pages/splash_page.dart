import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final String title;

  const SplashPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/cat.png',
                width: 128,
                height: 128,
              ),
              const SizedBox(height: 16),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 24),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
    );
  }
}
