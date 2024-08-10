import 'dart:convert';

import 'package:http/http.dart' as http;

import 'breed_dto.dart';

class BreedApi {
  static const _apiKey = '';

  static const _baseUrl = 'api.thecatapi.com';

  static Map<String, String> get _headers => {
        'x-api-key': _apiKey,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

  static Future<List<BreedDto>> fetchBreeds() async {
    final breedsUri = Uri.https(_baseUrl, '/v1/breeds');
    final response = await http.get(breedsUri, headers: _headers);
    final List<dynamic> rawBreeds = jsonDecode(response.body);
    return rawBreeds.map((rawBreed) => BreedDto.fromJson(rawBreed)).toList();
  }

  static Future<String> fetchImage(
    String imageId, {
    required String fallback,
  }) async {
    final imageUri = Uri.https(_baseUrl, '/v1/images/$imageId');
    final response = await http.get(imageUri, headers: _headers);
    final Map<String, dynamic> rawImage = jsonDecode(response.body);
    return rawImage['url'] ?? fallback;
  }
}
