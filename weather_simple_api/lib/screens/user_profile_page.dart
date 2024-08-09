// lib/screens/user_profile_page.dart
import 'package:flutter/material.dart';
import '../widgets/bottom_app_bar.dart'; // Import the BottomAppBarWidget

class UserProfilePage extends StatefulWidget {
  final String username;

  UserProfilePage({required this.username});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool isFollowing = false;

  void _toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  void _showImagePopup(String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Transparent background
          child: Container(
            width: 400, // Set width of the popup window
            height: 400, // Set height of the popup window
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // List of images for posts
  final List<String> postImages = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: Text(widget.username, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Action for more options
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 0,
          ),
          // Profile header
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.black, // Black background for header
            child: Row(
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
                        widget.username,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'This is the user bio. It can be a short description about the user.',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('120',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text('Posts',
                                  style: TextStyle(color: Colors.grey[500])),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text('200k',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text('Followers',
                                  style: TextStyle(color: Colors.grey[500])),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text('180',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text('Following',
                                  style: TextStyle(color: Colors.grey[500])),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _toggleFollow,
                        child: Text(isFollowing ? 'Following' : 'Follow'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue, // Background color of the button
                          foregroundColor:
                              Colors.white, // Text color of the button
                          minimumSize: Size(double.infinity, 40),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // User posts section
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
                  onTap: () => _showImagePopup(
                      postImages[index]), // Show popup on image tap
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
}
