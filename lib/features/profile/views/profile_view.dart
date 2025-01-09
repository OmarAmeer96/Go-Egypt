import 'package:flutter/material.dart';
import 'package:go_egypt/features/profile/widgets/custom_list_tile.dart';
import 'package:go_egypt/features/profile/widgets/profile_pic_frame.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = '';
  String phone = '';
  String email = '';
  String password = '';

  getCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name") ?? "";
    phone = prefs.getString("phone") ?? "";
    email = prefs.getString("email") ?? "";
    password = prefs.getString("pass") ?? "";
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCredentials();
  }

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
              subtitle: name,
            ),
            CustomListTile(
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: phone,
            ),
            CustomListTile(
              icon: Icons.mail_rounded,
              title: 'Email',
              subtitle: email,
            ),
            CustomListTile(
              icon: Icons.password,
              title: 'Password',
              subtitle: hashedPassword(password.length),
            ),
          ],
        ),
      ),
    );
  }

  String hashedPassword(int passLength) {
    String stars = '';
    for (int i = 0; i < passLength; i++) {
      stars += '*';
    }
    return stars;
  }
}
