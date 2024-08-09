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
      backgroundColor: Colors.black, // Set background color to dark
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InstagramLogo(), // Ensure the logo fits well with the dark background
            SizedBox(height: 40),
            CustomTextField(
              hintText: 'Username',
              textColor: Colors.white, // Update text color to fit dark theme
              hintColor: Colors.grey[400]!, // Update hint color for dark theme
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Password',
              obscureText: true,
              textColor: Colors.white, // Update text color to fit dark theme
              hintColor: Colors.grey[400]!, // Update hint color for dark theme
            ),
            SizedBox(height: 20),
            SignInButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              buttonColor: Colors.blue, // Ensure button color fits dark theme
              textColor: Colors.white, // Update button text color for contrast
            ),
            SizedBox(height: 20),
            SignUpText(
              textColor: Colors.grey[400]!, // Update text color for dark theme
            ),
          ],
        ),
      ),
    );
  }
}
