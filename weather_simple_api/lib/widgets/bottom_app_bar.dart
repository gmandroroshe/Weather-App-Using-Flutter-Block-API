// lib/widgets/bottom_app_bar.dart
import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black, // Dark background color for BottomAppBar
      elevation: 8, // Add elevation for a shadow effect
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white), // White icon color
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white), // White icon color
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: Icon(Icons.add_box_outlined,
                color: Colors.white), // White icon color
            onPressed: () {
              Navigator.pushNamed(context, '/add_post');
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border,
                color: Colors.white), // White icon color
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle,
                color: Colors.white), // White icon color
            onPressed: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
        ],
      ),
    );
  }
}
