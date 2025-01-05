class PlaceModel{
  String imagePath;
  String name;
  PlaceModel({required this.name,required this.imagePath});

  static List<PlaceModel> places = [
    PlaceModel(imagePath:
    'https://media.istockphoto.com/id/1222196925/photo/view-over-main-ancient-egyptian-temple-at-abu-simbel.jpg?b=1&s=612x612&w=0&k=20&c=iltSnB0cou-8l5Oh1GjYyq_iO3lwxBrWss6uwJKyvp0=',
      name: 'Abu-Simbel Temple',),
    PlaceModel( imagePath:
    'https://media.istockphoto.com/id/96318973/photo/pyramids-egypt.jpg?b=1&s=612x612&w=0&k=20&c=iUppfLGi7_E21NkIbh791JHrbZedszAqOrSsxPlQjyI=',
      name: 'Pyramids',),
    PlaceModel(imagePath:
    'https://media.istockphoto.com/id/465985662/photo/view-of-the-karnak-temple-in-the-evening-egypt.jpg?s=612x612&w=0&k=20&c=3VCo1js0eJoUwxJDGywyhphXh93ifOhfvJ0dR0wvzik=',
      name: 'Karnak Temple',),
    PlaceModel(imagePath:
    'https://media.istockphoto.com/id/1327507461/photo/traditional-nile-sailboats-near-the-banks-of-aswan-egypt.jpg?s=612x612&w=0&k=20&c=V_rKmNg0bq1hoU2joWZ_Ov_taWpCYzQ7MbL1f4wIEwA=',
      name: 'Nile river Cruise',),
    PlaceModel(imagePath: 'https://momaa.org/wp-content/uploads/2019/10/Bibliotheca-Alexandrina-1-1024x568.png',
      name: 'Library of Alexandria',),
  ]
  ;
}