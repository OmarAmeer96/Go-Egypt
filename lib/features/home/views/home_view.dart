import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_egypt/core/core_cubits/language_cubit.dart';
import 'package:go_egypt/features/home/models/card_model.dart';
import 'package:go_egypt/generated/l10n.dart';
import '../widgets/card_widget.dart';
import '../widgets/place_item_widget.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<LanguageCubit>().toggleLanguage();
            },
            icon: SvgPicture.asset(
              "assets/icons/language_icon.svg",
              width: 35,
            ),
          ),
        ],
        title: Text(
          S.of(context).suggested_places_to_visit,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) =>
                      PlaceItemWidget(index: index),
                  itemCount: 5,
                ),
              ),
              Text(
                S.of(context).popular_places,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF324980),
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
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
