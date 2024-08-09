import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  final Color textColor;

  SignUpText({this.textColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to sign up page
      },
      child: Text(
        'Don\'t have an account? Sign Up',
        style: TextStyle(color: textColor),
      ),
    );
  }
}
