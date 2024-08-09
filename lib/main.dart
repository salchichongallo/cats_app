import 'package:cats_app/breed_dto.dart';
import 'package:cats_app/pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const _title = 'Catbreeds';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)).then(
          (_) => BreedDto.mockBreeds,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LandingPage(title: _title, breeds: snapshot.data!);
          }
          return const SplashPage(title: _title);
        },
      ),
    );
  }
}
