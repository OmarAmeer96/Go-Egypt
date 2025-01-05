import 'package:flutter/material.dart';
import 'package:go_egypt/features/governments/models/landmarks_model.dart';
import 'package:go_egypt/features/governments/widgets/build_landmark_dialog.dart';
import 'package:go_egypt/features/governments/widgets/gorenment_banner_item.dart';
import 'package:go_egypt/features/governments/widgets/landmark_card_item.dart';

class GovernmentDetailsView extends StatelessWidget {
  final String governorate;
  final String image;

  const GovernmentDetailsView({
    super.key,
    required this.governorate,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final filteredLandmarks = LandmarksModel.landmarks
        .where(
          (landmark) => landmark.governorate == governorate,
        )
        .toList();

    return Scaffold(
      appBar: buildGovernmentsDetailsAppBar(),
      body: Column(
        children: [
          Hero(
            tag: governorate,
            child: GovernmentBannerItem(image: image),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: filteredLandmarks.length,
              itemBuilder: (context, index) {
                final landmark = filteredLandmarks[index];
                return GestureDetector(
                  onTap: () {
                    buildLandmarkDialog(context, landmark, governorate);
                  },
                  child: LandmarkCardItem(landmark: landmark),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildGovernmentsDetailsAppBar() {
    return AppBar(
      title: Text(
        '$governorate Landmarks',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: Colors.purple,
      elevation: 2,
    );
  }
}
