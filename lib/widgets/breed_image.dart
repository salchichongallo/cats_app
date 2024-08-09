import 'package:cats_app/breed_api.dart';
import 'package:flutter/material.dart';

class BreedImage extends StatelessWidget {
  final String id;

  const BreedImage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BreedApi.fetchImage(id),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasError) {
          return const Center(child: Icon(Icons.error));
        }
        return Image.network(snapshot.data as String, fit: BoxFit.cover);
      },
    );
  }
}
