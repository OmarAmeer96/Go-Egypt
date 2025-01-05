import 'package:go_egypt/features/home/models/place_model.dart';

class CardModel {
  String imagePath;

  String name;

  String government;

  CardModel(
      {required this.imagePath, required this.name, required this.government});

  static List<CardModel> cards = [
    CardModel(
        imagePath: PlaceModel.places[0].imagePath,
        name: PlaceModel.places[0].name,
        government: 'Aswan'),
    CardModel(
        imagePath:PlaceModel.places[1].imagePath,
        name: PlaceModel.places[1].name,
        government: 'Giza'),
    CardModel(
        imagePath:PlaceModel.places[2].imagePath,
        name: PlaceModel.places[2].name,
        government: 'Luxor'),
    CardModel(
        imagePath:PlaceModel.places[3].imagePath,
        name: PlaceModel.places[3].name,
        government: ' Aswan'),
    CardModel(
        imagePath: PlaceModel.places[4].imagePath,
        name: PlaceModel.places[4].name,
        government: ' Alexandria'),
    // Add more cards as needed
  ];
}
