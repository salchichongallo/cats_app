import 'package:flutter/material.dart';

import '../breed_dto.dart';

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
              child: Image.network(
                breed.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(breed.description),
                      const SizedBox(height: 24),
                      Text(
                        'Temperament',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(breed.temperament),
                      const SizedBox(height: 24),
                      Text(
                        'Other Features',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: [
                          Chip(label: Text('Origin: ${breed.origin}')),
                          Chip(
                            label: Text('Intelligence: ${breed.intelligence}'),
                          ),
                          Chip(
                            label: Text('Adaptability: ${breed.adaptability}'),
                          ),
                          Chip(
                            label: Text(
                              'Life Span: ${breed.lifeSpanInYears} years',
                            ),
                          ),
                          Chip(
                            label:
                                Text('Child Friendly: ${breed.childFriendly}'),
                          ),
                          Chip(
                            label: Text('Social Needs: ${breed.socialNeeds}'),
                          ),
                          Chip(
                            label: Text('Grooming: ${breed.grooming}'),
                          ),
                          Chip(
                            label: Text(
                                'Stranger Friendly: ${breed.strangerFriendly}'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
