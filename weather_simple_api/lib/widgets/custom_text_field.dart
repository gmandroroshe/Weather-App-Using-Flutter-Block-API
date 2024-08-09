import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Color textColor;
  final Color hintColor;

  CustomTextField({
    required this.hintText,
    this.obscureText = false,
    this.textColor = Colors.white,
    this.hintColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[700]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
