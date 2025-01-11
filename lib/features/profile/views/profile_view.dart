import 'package:flutter/material.dart';
import 'package:go_egypt/features/profile/widgets/custom_list_tile.dart';
import 'package:go_egypt/features/profile/widgets/custom_text_buttom.dart';
import 'package:go_egypt/features/profile/widgets/custom_editing_text_field.dart';
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
            ),
            SizedBox(
              height: 20,
            ),
            CustomListTile(
              icon: Icons.person,
              title: 'Full Name',
              subtitle: name,
              id: 'name',
              onPressed: () {
                showEditDialog(context, 'name', 'Name');
              },
            ),
            CustomListTile(
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: phone,
              id: 'phone',
              onPressed: () {
                showEditDialog(context, 'phone', 'Phone Number');
              },
            ),
            CustomListTile(
              icon: Icons.mail_rounded,
              title: 'Email',
              subtitle: email,
              id: 'email',
              onPressed: () {
                showEditDialog(context, 'email', 'Email');
              },
            ),
            CustomListTile(
              icon: Icons.password,
              title: 'Password',
              subtitle: hashedPassword(password.length),
              id: 'password',
              onPressed: () {
                showEditDialog(context, 'password', 'Password');
              },
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

  Future<void> showEditDialog(
      BuildContext context, String id, String title) async {
    String editedValue = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Edit $title',
            style: TextStyle(
              color: const Color(0xFF0f3c4d),
            ),
          ),
          content: CustomEditingTextField(
            id: id,
            onChanged: (value) {
              editedValue = value;
            },
          ),
          actions: <Widget>[
            CustomTextButtom(
              text: 'Confirm',
              onPressed: () {
                switch (id) {
                  case 'name':
                    name = editedValue;
                    break;
                  case 'phone':
                    phone = editedValue;
                    break;
                  case 'email':
                    email = editedValue;
                    break;
                  case 'password':
                    password = editedValue;
                    break;
                  default:
                }
                setState(() {});
                Navigator.pop(context);
                const snackBar = SnackBar(
                  content: Text('Profile has successfully updated'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            CustomTextButtom(
              text: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
