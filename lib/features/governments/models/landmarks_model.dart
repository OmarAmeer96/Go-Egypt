class LandmarksModel {
  final String name;
  final String image;
  final String governorate;

  const LandmarksModel({
    required this.name,
    required this.image,
    required this.governorate,
  });

  static const List<LandmarksModel> landmarks = [
    LandmarksModel(
      name: 'Pyramids of Giza',
      image:
          'https://www.touristegypt.com/wp-content/uploads/2023/03/giza-pyramids-cairo-egypt-with-palm-1024x634.jpg',
      governorate: 'Cairo',
    ),
    LandmarksModel(
      name: 'Egyptian Museum',
      image:
          'https://images.e-flux-systems.com/526205_de263a8418a1ac64e0b7ad4673eeb0f7.jpg,1600',
      governorate: 'Cairo',
    ),
    LandmarksModel(
      name: 'Library of Alexandria',
      image:
          'https://momaa.org/wp-content/uploads/2019/10/Bibliotheca-Alexandrina-1-1024x568.png',
      governorate: 'Alexandria',
    ),
    LandmarksModel(
      name: 'Qaitbay Citadel',
      image: 'https://images.memphistours.com/large/1117259721_alexandria.jpg',
      governorate: 'Alexandria',
    ),
    LandmarksModel(
      name: 'Valley of the Kings',
      image:
          'https://i0.wp.com/www.touristegypt.com/wp-content/uploads/2023/05/luxor.jpg?fit=1000%2C552&ssl=1',
      governorate: 'Luxor',
    ),
    LandmarksModel(
      name: 'Karnak Temple',
      image:
          'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/49581/file-manager/karnak-temple.jpg',
      governorate: 'Luxor',
    ),
  ];
}
