import 'package:cats_app/breed_dto.dart';
import 'package:flutter/material.dart';

import '../widgets/breed_overview_card.dart';
import 'breed_details_page.dart';

class LandingPage extends StatelessWidget {
  final String title;

  final List<BreedDto> breeds;

  const LandingPage({
    super.key,
    required this.title,
    required this.breeds,
  });

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
          child: ListView.builder(
            itemCount: breeds.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final breed = breeds[index];
              return BreedOverviewCard(
                breed: breed,
                onPressed: () => onCatPressed(context, breed),
              );
            },
          ),
        ),
      ),
    );
  }
}
