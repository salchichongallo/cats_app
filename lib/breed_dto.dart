class BreedDto {
  final String id;
  final String name;
  final String imageUrl;
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
    required this.imageUrl,
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

  static const mock = BreedDto(
    id: 'abys',
    name: 'Abyssinian',
    imageUrl: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
    origin: 'Egypt',
    intelligence: 5,
    description:
        'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',
    temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
    adaptability: 3,
    lifeSpanInYears: '12-15',
    childFriendly: 4,
    socialNeeds: 5,
    grooming: 1,
    strangerFriendly: 3,
  );

  static const mock2 = BreedDto(
    id: 'aege',
    name: 'Aegean',
    imageUrl: 'https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg',
    origin: 'Greece',
    intelligence: 3,
    description:
        'Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.',
    temperament: 'Affectionate, Social, Intelligent, Playful, Active',
    adaptability: 5,
    lifeSpanInYears: '9-12',
    childFriendly: 4,
    socialNeeds: 4,
    grooming: 3,
    strangerFriendly: 4,
  );
}
