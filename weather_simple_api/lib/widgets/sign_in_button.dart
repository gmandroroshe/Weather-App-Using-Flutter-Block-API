// lib/widgets/sign_in_button.dart
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  SignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Sign In'),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}
