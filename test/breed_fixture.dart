import 'package:cats_app/breed_dto.dart';

BreedDto buildBreed({
  String? id,
  String? name,
  String? imageId,
  String? origin,
  int? intelligence,
  String? description,
  String? temperament,
  int? adaptability,
  String? lifeSpanInYears,
  int? childFriendly,
  int? socialNeeds,
  int? grooming,
  int? strangerFriendly,
}) {
  return BreedDto(
    id: id ?? 'abys',
    name: name ?? 'Abyssinian',
    imageId: imageId ?? '1',
    origin: origin ?? 'Egypt',
    intelligence: intelligence ?? 5,
    description: description ??
        'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',
    temperament:
        temperament ?? 'Active, Energetic, Independent, Intelligent, Gentle',
    adaptability: adaptability ?? 3,
    lifeSpanInYears: lifeSpanInYears ?? '12-15',
    childFriendly: childFriendly ?? 4,
    socialNeeds: socialNeeds ?? 5,
    grooming: grooming ?? 1,
    strangerFriendly: strangerFriendly ?? 3,
  );
}
