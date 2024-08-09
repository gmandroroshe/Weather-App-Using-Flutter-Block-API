// lib/screens/add_post_page.dart
import 'package:flutter/material.dart';
import '../widgets/bottom_app_bar.dart'; // Import the BottomAppBarWidget

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background color for Scaffold
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Add Post',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Action for selecting an image
              },
              child: Container(
                color: Colors.grey[800], // Dark color for image placeholder
                width: double.infinity,
                height: 200,
                child: Center(
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Caption',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _captionController,
                style: TextStyle(color: Colors.white), // White text color
                decoration: InputDecoration(
                  hintText: 'Write a caption...',
                  hintStyle: TextStyle(color: Colors.grey), // Grey hint color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a caption';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // Action for submitting the form
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Post added')),
                  );
                }
              },
              child: Text('Add Post'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(), // Add BottomAppBar here
    );
  }
}
