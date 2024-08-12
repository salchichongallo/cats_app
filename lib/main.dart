import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'breed_api.dart';
import 'pages/landing_page.dart';
import 'pages/splash_page.dart';

void main() {
  BreedApi.instance = BreedApi(client: http.Client(), apiKey: '');
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
        fontFamily: 'Poppins',
      ),
      home: FutureBuilder(
        future: BreedApi.instance.fetchBreeds(),
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
