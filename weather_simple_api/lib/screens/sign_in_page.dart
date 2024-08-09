// lib/screens/sign_in_page.dart
import 'package:flutter/material.dart';
import '../widgets/instagram_logo.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/sign_in_button.dart';
import '../widgets/sign_up_text.dart';
import 'home_page.dart'; // Import the home page

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InstagramLogo(),
            SizedBox(height: 40),
            CustomTextField(hintText: 'Username'),
            SizedBox(height: 20),
            CustomTextField(hintText: 'Password', obscureText: true),
            SizedBox(height: 20),
            SignInButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            SizedBox(height: 20),
            SignUpText(),
          ],
        ),
      ),
    );
  }
}
