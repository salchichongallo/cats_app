import 'package:flutter/material.dart';

import '../breed_dto.dart';
import '../widgets/breed_features.dart';
import '../widgets/breed_image.dart';
import '../widgets/breed_section.dart';

class BreedDetailsPage extends StatelessWidget {
  final BreedDto breed;

  const BreedDetailsPage({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: BreedImage(id: breed.imageId),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildBreedInfo(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBreedInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BreedSection(title: 'Description', child: Text(breed.description)),
        BreedSection(title: 'Temperament', child: Text(breed.temperament)),
        BreedSection(
          title: 'Other Features',
          child: BreedFeatures(breed: breed),
        ),
      ],
    );
  }
}
