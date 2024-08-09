// lib/screens/account_page.dart
import 'package:flutter/material.dart';
import '../widgets/bottom_app_bar.dart'; // Import the BottomAppBarWidget

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Colors.black, // Set background color to black
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Add menu functionality here
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Profile header
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.black, // Black background for header
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[700],
                  backgroundImage:
                      AssetImage('assets/2.png'), // Placeholder image
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'This is the user bio. It can be a short description about the user.',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                '120',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Posts',
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '200k',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '180',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 40),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // User posts section
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: 12, // Number of dummy images
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/${(index % 6) + 1}.png'), // Loop through images
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
}
