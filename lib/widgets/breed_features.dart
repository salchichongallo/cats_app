import 'package:flutter/material.dart';

import '../breed_dto.dart';

class BreedFeatures extends StatelessWidget {
  final BreedDto breed;

  const BreedFeatures({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        Chip(label: Text('Origin: ${breed.origin}')),
        Chip(label: Text('Intelligence: ${breed.intelligence}')),
        Chip(label: Text('Adaptability: ${breed.adaptability}')),
        Chip(label: Text('Life Span: ${breed.lifeSpanInYears} years')),
        Chip(label: Text('Child Friendly: ${breed.childFriendly}')),
        Chip(label: Text('Social Needs: ${breed.socialNeeds}')),
        Chip(label: Text('Grooming: ${breed.grooming}')),
        Chip(label: Text('Stranger Friendly: ${breed.strangerFriendly}')),
      ],
    );
  }
}
