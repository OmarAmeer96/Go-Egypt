import 'package:flutter/material.dart';
import 'package:go_egypt/features/governments/models/governments_model.dart';
import 'package:go_egypt/features/governments/widgets/government_card_item.dart';

class GovernmentsView extends StatelessWidget {
  const GovernmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGovernmentsViewAppBar(),
      body: Stack(
        children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: Governorate.governorates.length,
            itemBuilder: (context, index) {
              final governorate = Governorate.governorates[index];
              return GovernmentCardItem(governorate: governorate);
            },
          ),
        ],
      ),
    );
  }

  AppBar buildGovernmentsViewAppBar() {
    return AppBar(
      title: const Text(
        'Governments of Egypt',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.purple,
      elevation: 2,
    );
  }
}
