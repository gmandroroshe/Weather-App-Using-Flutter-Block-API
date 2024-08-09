// lib/screens/home_page.dart
import 'package:flutter/material.dart';
import '../widgets/bottom_app_bar.dart'; // Import the BottomAppBarWidget
import 'user_profile_page.dart'; // Import the user profile page

class HomePage extends StatelessWidget {
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
  ];

  // List of image paths for profile avatars
  final List<String> profileImages = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () {
              // Action for add post
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Action for notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.message_outlined),
            onPressed: () {
              // Action for messages
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Stories section
          Container(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  profileImages.length, // Updated to use profileImages list
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserProfilePage(username: 'User $index'),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: AssetImage(profileImages[
                              index]), // Use different profile image for each user
                        ),
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        child: Text(
                          'User $index',
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Posts section
          Expanded(
            child: ListView.builder(
              itemCount: postImages.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          backgroundImage: AssetImage(profileImages[index %
                              profileImages
                                  .length]), // Use different profile image for each user
                        ),
                        title: Text('User $index'),
                        trailing: IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {
                            // Action for more options
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Example action for tapping on the post image
                        },
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          child: Image.asset(
                            postImages[
                                index], // Use different image for each post
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              // Action for liking the post
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.comment_outlined),
                            onPressed: () {
                              // Action for commenting on the post
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.send_outlined),
                            onPressed: () {
                              // Action for sharing the post
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'User $index: This is a sample caption for the post.',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
