import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomEditingTextField extends StatelessWidget {
  CustomEditingTextField(
      {super.key, required this.onChanged, required this.id});

  final Function(String)? onChanged;
  bool obscureText = false;
  final String id;

  @override
  Widget build(BuildContext context) {
    if (id == 'password') {
      obscureText = true;
    }
    
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: const InputDecoration(
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
    );
  }
}
