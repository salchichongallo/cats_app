class BreedDto {
  final String id;
  final String name;
  final String? imageId;
  final String origin;
  final int intelligence;
  final String description;
  final String temperament;
  final int adaptability;
  final String lifeSpanInYears;
  final int childFriendly;
  final int socialNeeds;
  final int grooming;
  final int strangerFriendly;

  const BreedDto({
    required this.id,
    required this.name,
    required this.imageId,
    required this.origin,
    required this.intelligence,
    required this.description,
    required this.temperament,
    required this.adaptability,
    required this.lifeSpanInYears,
    required this.childFriendly,
    required this.socialNeeds,
    required this.grooming,
    required this.strangerFriendly,
  });

  factory BreedDto.fromJson(Map<String, dynamic> breed) {
    return BreedDto(
      id: breed['id'],
      name: breed['name'],
      imageId: breed['reference_image_id'],
      origin: breed['origin'],
      intelligence: breed['intelligence'],
      description: breed['description'],
      temperament: breed['temperament'],
      adaptability: breed['adaptability'],
      lifeSpanInYears: breed['life_span'],
      childFriendly: breed['child_friendly'],
      socialNeeds: breed['social_needs'],
      grooming: breed['grooming'],
      strangerFriendly: breed['stranger_friendly'],
    );
  }
}
