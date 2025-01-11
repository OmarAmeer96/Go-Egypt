import 'package:flutter/material.dart';
import 'package:go_egypt/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt/features/home/models/card_model.dart';
import 'package:go_egypt/features/home/widgets/place_item_widget.dart';

class CardWidget extends StatefulWidget {
  final int index;
  final CardModel card;
  const CardWidget({
    super.key,
    required this.card,
    required this.index,
  });
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      child: Column(
        children: [
          PlaceItemWidget(
            index: widget.index,
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  isCurrentLocaleEnglish()
                      ? widget.card.enGovernmentName
                      : widget.card.arGovernmentName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    pressed = !pressed;
                    setState(() {});
                  },
                  icon: Icon(
                    pressed ? Icons.favorite : Icons.favorite_border_outlined,
                    color: pressed ? Colors.red : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
