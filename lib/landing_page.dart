import 'package:cats_app/breed_dto.dart';
import 'package:cats_app/widgets/cat_overview_card.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final String title;

  const LandingPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [CatOverviewCard(breed: BreedDto.mock)],
          ),
        ),
      ),
    );
  }
}
