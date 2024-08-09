import 'package:cats_app/breed_dto.dart';
import 'package:flutter/material.dart';

class CatOverviewCard extends StatelessWidget {
  final BreedDto breed;

  const CatOverviewCard({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(breed.name),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('View'),
            ),
          ),
          Image.network(
            breed.imageUrl,
            fit: BoxFit.cover,
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
