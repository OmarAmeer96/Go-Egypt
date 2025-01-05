import 'package:flutter/material.dart';
import 'package:go_egypt/features/home/models/card_model.dart';
import '../widgets/card_widget.dart';
import '../widgets/place_item_widget.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home';


  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Suggested Places to visit ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF324980)),
                ),
                SizedBox(
                  height: size.height * 0.4,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, mainAxisSpacing: 10),
                    itemBuilder: (context, index) => PlaceItemWidget(
                      index: index,
                    ),
                    itemCount: 5,
                  ),
                ),
                const Text(
                  'Popular Places ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF324980)
                  ),
                ),
                SizedBox(
                    height: size.height * 0.4,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CardWidget(
                          card: CardModel.cards[index],
                          index: index,
                        ),
                        itemCount:5
                    ))
              ],
            ),
          ),
        ),
    );
  }

}
