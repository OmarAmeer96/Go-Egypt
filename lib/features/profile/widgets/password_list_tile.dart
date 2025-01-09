import 'package:flutter/material.dart';
import 'package:go_egypt/features/profile/widgets/show_edit_dialog.dart';

class PasswordListTile extends StatelessWidget {
  const PasswordListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ListTile(
        leading: Icon(
          Icons.password,
          color: const Color(0xFF0f3c4d),
        ),
        title: Text('Password'),
        subtitle: Text('subtitle'),
        trailing: IconButton(
          onPressed: () {
            // showEditDialog(context, true);
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
