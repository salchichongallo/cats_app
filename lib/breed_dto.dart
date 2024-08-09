class BreedDto {
  final String id;
  final String name;
  final String imageUrl;
  final String origin;
  final int intelligence;

  const BreedDto({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.origin,
    required this.intelligence,
  });

  static const mock = BreedDto(
    id: 'asho',
    name: 'American Shorthair',
    imageUrl: 'https://cdn2.thecatapi.com/images/JFPROfGtQ.jpg',
    origin: 'Greece',
    intelligence: 3,
  );
}
