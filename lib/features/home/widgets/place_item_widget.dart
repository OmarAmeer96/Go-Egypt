import 'package:flutter/material.dart';
import 'package:go_egypt/features/home/models/place_model.dart';

class PlaceItemWidget extends StatelessWidget {
  int index;
  PlaceItemWidget({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(15),
              child: Image.network(PlaceModel.places[index].imagePath,fit: BoxFit.cover,)),
          const SizedBox(height: 5,),
          Text(
            PlaceModel.places[index].name,
            style: const TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
