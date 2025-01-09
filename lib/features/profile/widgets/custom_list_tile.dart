import 'package:flutter/material.dart';
import 'package:go_egypt/features/profile/widgets/show_edit_dialog.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF0f3c4d),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          onPressed: () {
            showEditDialog(context, false, title);
          },
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: Color(0xFF0f3c4d),
          ),
        ),
      ),
    );
  }
}
