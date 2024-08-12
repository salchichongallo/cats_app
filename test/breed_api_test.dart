import 'dart:convert';
import 'dart:io';

import 'package:cats_app/breed_api.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  setUpAll(() {
    registerFallbackValue(Uri());
  });

  group('fetch breeds', () {
    test('should fetch a breed', () async {
      final client = MockHttpClient();
      final breed = {
        'id': 'abys',
        'name': 'Abyssinian',
        'reference_image_id': '1',
        'origin': 'Egypt',
        'intelligence': 5,
        'description': 'foo',
        'temperament': 'bar',
        'adaptability': 5,
        'life_span': '14 - 15',
        'child_friendly': 4,
        'social_needs': 5,
        'grooming': 1,
        'stranger_friendly': 2,
      };
      final responseBody = jsonEncode([breed]);
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(responseBody, 200));
      final api = BreedApi(client: client, apiKey: '');

      final breeds = await api.fetchBreeds();

      expect(breeds, hasLength(1));
      expect(breeds.first.id, breed['id']);
      verify(() => client.get(any(), headers: any(named: 'headers'))).called(1);
    });

    test('should fetch empty breeds', () async {
      final client = MockHttpClient();
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('[]', HttpStatus.ok));
      final api = BreedApi(client: client, apiKey: '');

      final breeds = await api.fetchBreeds();

      expect(breeds, isEmpty);
    });
  });

  group('fetch breed images', () {
    test('should fetch a breed image', () async {
      final client = MockHttpClient();
      when(() => client.get(any(), headers: any(named: 'headers'))).thenAnswer(
          (_) async => http.Response('{ "url": "foo" }', HttpStatus.ok));
      final api = BreedApi(client: client, apiKey: '');

      final imageUrl = await api.fetchImage('test-id', fallback: '');

      expect(imageUrl, 'foo');
    });

    test('should fallback to a default image if response does not have an URL',
        () async {
      final client = MockHttpClient();
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('{}', HttpStatus.ok));
      final api = BreedApi(client: client, apiKey: '');

      final imageUrl = await api.fetchImage('', fallback: 'bar');

      expect(imageUrl, 'bar');
    });
  });
}
