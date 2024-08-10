import 'package:flutter/material.dart';

import '../breed_dto.dart';
import 'breed_image.dart';

class BreedOverviewCard extends StatelessWidget {
  final BreedDto breed;

  final VoidCallback onPressed;

  const BreedOverviewCard({
    super.key,
    required this.breed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(breed.name),
            trailing: TextButton(
              onPressed: onPressed,
              child: const Text('View'),
            ),
          ),
          AspectRatio(
            aspectRatio: 4 / 3,
            child: BreedImage(id: breed.imageId),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 16,
              right: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Origin: ${breed.origin}'),
                Text('Intelligence: ${breed.intelligence}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
