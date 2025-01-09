import 'package:flutter/material.dart';

Future<void> showEditDialog(BuildContext context, bool? ispassword, String title) async {
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
        content: TextFormField(
          obscureText: ispassword ?? false,
          decoration: const InputDecoration(
            hintText: '',
            hintStyle: TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0f3c4d)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0f3c4d)),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Confirm',
              style: const TextStyle(
                color: Color(0xFF0f3c4d),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              const snackBar = SnackBar(
                content: Text('Profile has successfully updated'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          TextButton(
            child: Text(
              'Back',
              style: const TextStyle(
                color: Color(0xFF0f3c4d),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
