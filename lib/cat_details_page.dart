import 'package:flutter/material.dart';

class CatDetailsPage extends StatelessWidget {
  const CatDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre raza'),
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
            Image.network(
              'https://cdn2.thecatapi.com/images/tv8tNeYaU.jpg',
              fit: BoxFit.cover,
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
                      const Text(
                        'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',
                      ),
                      const SizedBox(height: 24),
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
