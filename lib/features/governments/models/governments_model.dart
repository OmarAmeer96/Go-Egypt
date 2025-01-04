class Governorate {
  final String name;
  final String image;

  const Governorate({
    required this.name,
    required this.image,
  });

  static const List<Governorate> governorates = [
    Governorate(
      name: 'Cairo',
      image:
          'https://i0.wp.com/www.re-thinkingthefuture.com/wp-content/uploads/2024/01/6.-Cairo-Egypt-cover_900_584.jpg?w=999',
    ),
    Governorate(
      name: 'Alexandria',
      image:
          'https://www.cleopatraegypttours.com/wp-content/uploads/2018/08/Alexandria-Egypt.jpg',
    ),
    Governorate(
      name: 'Luxor',
      image:
          'https://cdn.britannica.com/08/178108-050-F19D0A38/statues-entrance-Ramses-II-Luxor-temple-complex.jpg',
    ),
  ];
}
