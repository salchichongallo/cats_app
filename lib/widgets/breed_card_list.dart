import 'package:flutter/material.dart';

import '../breed_dto.dart';
import 'breed_overview_card.dart';
import 'empty_state.dart';

class BreedCardList extends StatelessWidget {
  final List<BreedDto> breeds;
  final Function(BreedDto) onPressed;

  const BreedCardList({
    super.key,
    required this.breeds,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (breeds.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 64),
        child: EmptyState(
          title: 'Breeds not found',
          child: Text('Try another breed name.'),
        ),
      );
    }

    return ListView.builder(
      itemCount: breeds.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final breed = breeds[index];
        return BreedOverviewCard(
          breed: breed,
          onPressed: () => onPressed(breed),
        );
      },
    );
  }
}
