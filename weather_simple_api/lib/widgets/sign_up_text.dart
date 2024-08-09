// lib/widgets/sign_up_text.dart
import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Don’t have an account?'),
        TextButton(
          onPressed: () {
            // Navigate to Sign Up page
          },
          child: Text('Sign Up'),
        ),
      ],
    );
  }
}
