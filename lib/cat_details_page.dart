import 'package:flutter/material.dart';

import 'breed_dto.dart';

class CatDetailsPage extends StatelessWidget {
  final BreedDto breed;

  const CatDetailsPage({super.key, required this.breed});

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
                      // TODO: Add the rest of the details
                      Text(
                        'Temperament',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Active, Energetic, Independent, Intelligent, Gentle',
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Other Features',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      const Wrap(
                        spacing: 8,
                        children: [
                          Chip(label: Text('Origin: Egypt')),
                          Chip(label: Text('Intelligence: 5')),
                          Chip(label: Text('Adaptability: 5')),
                          Chip(label: Text('Life Span: 14-15 years')),
                          Chip(label: Text('Child Friendly: 4')),
                          Chip(label: Text('Social Needs: 0')),
                          Chip(label: Text('Grooming: 3')),
                          Chip(label: Text('Stranger Friendly: 3')),
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
