import 'dart:async';

import 'package:cats_app/breed_dto.dart';
import 'package:cats_app/widgets/breed_overview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'breed_fixture.dart';

Widget buildBreedCard({
  BreedDto? breed,
  VoidCallback? onPressed,
}) {
  breed ??= buildBreed();
  onPressed ??= () {};
  return MaterialApp(
    home: Scaffold(
      body: BreedOverviewCard(
        breed: breed,
        onPressed: onPressed,
      ),
    ),
  );
}

void main() {
  testWidgets('card has a view button', (tester) async {
    final onPressed = Completer<void>();
    await tester.pumpWidget(buildBreedCard(onPressed: onPressed.complete));
    final viewButton = find.text('View');
    await tester.tap(viewButton);
    expect(onPressed.isCompleted, isTrue);
  });

  testWidgets('card shows breed name', (tester) async {
    final breed = buildBreed(name: 'Abyssinian');
    await tester.pumpWidget(buildBreedCard(breed: breed));
    final breedName = find.text(breed.name);
    expect(breedName, findsOneWidget);
  });

  testWidgets('card shows breed intelligence', (tester) async {
    final breed = buildBreed(intelligence: 15);
    await tester.pumpWidget(buildBreedCard(breed: breed));
    final intelligence = find.text('Intelligence: ${breed.intelligence}');
    expect(intelligence, findsOneWidget);
  });

  testWidgets('card shows breed origin', (tester) async {
    final breed = buildBreed(origin: 'Egypt');
    await tester.pumpWidget(buildBreedCard(breed: breed));
    final origin = find.text('Origin: ${breed.origin}');
    expect(origin, findsOneWidget);
  });
}
