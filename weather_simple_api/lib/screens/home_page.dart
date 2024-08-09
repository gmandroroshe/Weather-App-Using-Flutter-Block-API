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
      backgroundColor: Colors.black, // Dark background color for Scaffold
      appBar: AppBar(
        title: Text('Instagram',
            style: TextStyle(color: Colors.white)), // White text color
        backgroundColor: Colors.black, // Dark background color for AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined,
                color: Colors.white), // White icon color
            onPressed: () {
              // Action for add post
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border,
                color: Colors.white), // White icon color
            onPressed: () {
              // Action for notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.message_outlined,
                color: Colors.white), // White icon color
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
                          backgroundColor: Colors
                              .grey[700], // Darker background for CircleAvatar
                          backgroundImage: AssetImage(profileImages[
                              index]), // Use different profile image for each user
                        ),
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        child: Text(
                          'User $index',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white), // White text color
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
                return PostCard(
                  postImage: postImages[index],
                  profileImage: profileImages[index % profileImages.length],
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

class PostCard extends StatefulWidget {
  final String postImage;
  final String profileImage;

  PostCard({required this.postImage, required this.profileImage});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard>
    with SingleTickerProviderStateMixin {
  bool _liked = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onDoubleTap() {
    setState(() {
      _liked = !_liked;
    });
    if (_liked) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.black, // Dark background color for Card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  Colors.grey[700], // Darker background for CircleAvatar
              backgroundImage: AssetImage(widget.profileImage),
            ),
            title: Text('User', style: TextStyle(color: Colors.white)),
            trailing: IconButton(
              icon: Icon(Icons.more_vert,
                  color: Colors.white), // White icon color
              onPressed: () {
                // Action for more options
              },
            ),
          ),
          GestureDetector(
            onDoubleTap: _onDoubleTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  widget.postImage,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                _liked
                    ? FadeTransition(
                        opacity: _animation,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 100,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {
                  // Action for liking the post
                },
              ),
              IconButton(
                icon: Icon(Icons.comment_outlined, color: Colors.white),
                onPressed: () {
                  // Action for commenting on the post
                },
              ),
              IconButton(
                icon: Icon(Icons.send_outlined, color: Colors.white),
                onPressed: () {
                  // Action for sharing the post
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'User: This is a sample caption for the post.',
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
