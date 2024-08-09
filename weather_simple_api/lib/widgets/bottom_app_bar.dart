// lib/widgets/bottom_app_bar.dart
import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/add_post');
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
        ],
      ),
    );
  }
}
