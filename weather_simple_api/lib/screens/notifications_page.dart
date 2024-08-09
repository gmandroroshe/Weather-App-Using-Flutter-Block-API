// lib/screens/notifications_page.dart
import 'package:flutter/material.dart';
import '../widgets/bottom_app_bar.dart'; // Import the BottomAppBarWidget

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: ListView(
        padding:
            EdgeInsets.symmetric(vertical: 10), // Add padding to the ListView
        children: [
          SizedBox(
            height: 20,
          ),
          // Dummy notifications
          NotificationTile(
            title: 'New follower',
            subtitle: 'John Doe followed you.',
            time: '2m ago',
          ),
          NotificationTile(
            title: 'New comment',
            subtitle: 'Jane Smith commented on your post.',
            time: '10m ago',
          ),
          NotificationTile(
            title: 'New like',
            subtitle: 'Alice Johnson liked your post.',
            time: '30m ago',
          ),
          NotificationTile(
            title: 'New message',
            subtitle: 'You have a new message from Bob.',
            time: '1h ago',
          ),
          NotificationTile(
            title: 'New comment',
            subtitle: 'Jane Smith commented on your post.',
            time: '10m ago',
          ),
          NotificationTile(
            title: 'New like',
            subtitle: 'Alice Johnson liked your post.',
            time: '30m ago',
          ),
          NotificationTile(
            title: 'New message',
            subtitle: 'You have a new message from Bob.',
            time: '1h ago',
          ),
          NotificationTile(
            title: 'New comment',
            subtitle: 'Jane Smith commented on your post.',
            time: '10m ago',
          ),
          NotificationTile(
            title: 'New like',
            subtitle: 'Alice Johnson liked your post.',
            time: '30m ago',
          ),
          NotificationTile(
            title: 'New message',
            subtitle: 'You have a new message from Bob.',
            time: '1h ago',
          ),
          // Add more notifications as needed
        ],
      ),
      bottomNavigationBar: BottomAppBarWidget(), // Add BottomAppBar here
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  NotificationTile(
      {required this.title, required this.subtitle, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 5, horizontal: 16), // Add margin between notifications
      decoration: BoxDecoration(
        color: Colors.grey[800], // Dark tile background
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16), // Add padding inside the container
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.white70),
        ),
        trailing: Text(
          time,
          style: TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}
