import 'package:flutter/material.dart';
import 'package:go_egypt/features/profile/widgets/custom_list_tile.dart';
import 'package:go_egypt/features/profile/widgets/password_list_tile.dart';
import 'package:go_egypt/features/profile/widgets/profile_pic_frame.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ProfilePicFrame(
              img:
                  "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_1280.jpg",
              // img: "https://i.imgur.com/BoN9kdC.png",
            ),
            SizedBox(
              height: 20,
            ),
            CustomListTile(
              icon: Icons.person,
              title: 'Full Name',
              subtitle: 'User Name',
            ),
            CustomListTile(
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: '+20 1024568522',
            ),
            CustomListTile(
              icon: Icons.mail_rounded,
              title: 'Email',
              subtitle: 'example@gmail.com',
            ),
            PasswordListTile(),
          ],
        ),
      ),
    );
  }
}
