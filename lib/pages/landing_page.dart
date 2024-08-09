import 'package:cats_app/breed_dto.dart';
import 'package:flutter/material.dart';

import '../widgets/breed_overview_card.dart';
import 'breed_details_page.dart';

class LandingPage extends StatelessWidget {
  final String title;

  const LandingPage({super.key, required this.title});

  onCatPressed(BuildContext context, BreedDto breed) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BreedDetailsPage(breed: breed)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BreedOverviewCard(
                breed: BreedDto.mock,
                onPressed: () => onCatPressed(context, BreedDto.mock),
              ),
              BreedOverviewCard(
                breed: BreedDto.mock2,
                onPressed: () => onCatPressed(context, BreedDto.mock2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
