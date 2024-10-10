import 'package:flutter/material.dart';

class Admin_profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                NetworkImage(_getImageUrl(context)), // Pass context here
          ),
          SizedBox(height: 20),
          Text('John Doe'), // Replace with actual user name
          Text('john@example.com'), // Replace with actual email
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement reset password logic here
            },
            child: Text('Reset Password'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement logout logic here
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }

  String _getImageUrl(BuildContext context) {
    // Implement logic to return the URL of the user's profile picture
    // This could be stored in SharedPreferences or fetched from an API
    return ''; // Placeholder
  }
}
