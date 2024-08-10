import 'package:flutter/material.dart';

import '../breed_api.dart';

class BreedImage extends StatelessWidget {
  final String? id;

  static const _fallbackImageUrl =
      'https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg';

  const BreedImage({super.key, required this.id});

  Future<String> _fetchImage() async {
    if (id == null) {
      return _fallbackImageUrl;
    }
    return BreedApi.fetchImage(id!).then((value) => value ?? _fallbackImageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchImage(),
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
