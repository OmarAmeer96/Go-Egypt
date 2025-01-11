import 'package:flutter/material.dart';
import 'package:go_egypt/features/governments/models/governments_model.dart';
import 'package:go_egypt/features/governments/views/widgets/government_card_item.dart';
import 'package:go_egypt/generated/l10n.dart';

class GovernmentsView extends StatelessWidget {
  const GovernmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGovernmentsViewAppBar(context),
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

  AppBar buildGovernmentsViewAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        S.of(context).governments_of_egypt,
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
