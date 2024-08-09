// lib/screens/search_page.dart

import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/bottom_app_bar.dart'; // Import the BottomAppBarWidget

class SearchPage extends StatelessWidget {
  // List of image paths for posts
  final List<String> postImages = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to dark
      body: Column(
        children: <Widget>[
          // Spacer to push the search bar down
          SizedBox(height: 30), // Adjust the height to your preference
          // Creative search bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
          ),
          // Spacer to add some space below the search bar
          SizedBox(height: 16), // Adjust the height as needed
          // Image gallery
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: postImages.length, // Number of images in the list
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showImageDialog(context, postImages[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            postImages[index]), // Use the image from the list
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBarWidget(), // Add BottomAppBar here
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return ZoomInImageDialog(imagePath: imagePath);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Custom zoom-in transition
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var scaleAnimation = animation.drive(tween);
          return ScaleTransition(
            scale: scaleAnimation,
            child: child,
          );
        },
      ),
    );
  }
}

class ZoomInImageDialog extends StatelessWidget {
  final String imagePath;

  ZoomInImageDialog({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // Close the dialog when tapping outside
      },
      child: Stack(
        children: [
          // Background blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black
                    .withOpacity(0.5), // Semi-transparent black overlay
              ),
            ),
          ),
          Center(
            child: Dialog(
              backgroundColor:
                  Colors.transparent, // Make the background transparent
              elevation: 0, // Remove default elevation
              child: Stack(
                children: [
                  GestureDetector(
                    onTap:
                        () {}, // Prevent the inner content from closing the dialog
                    child: Container(
                      width: 400, // Adjust size as needed
                      height: 400, // Adjust size as needed
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Close the dialog when tapping the close icon
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
