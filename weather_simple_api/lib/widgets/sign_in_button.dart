import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;

  SignInButton({
    required this.onPressed,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor, // Background color of the button
        foregroundColor: textColor, // Text color of the button
      ),
      child: Text('Sign In'),
    );
  }
}
