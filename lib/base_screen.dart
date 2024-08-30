import 'package:flutter/material.dart';
import 'explore_topics_screen.dart'; // Import the explore topics screen

class BaseScreen extends StatelessWidget {
  final String userName; // Add a variable to hold the user's name

  BaseScreen({required this.userName}); // Constructor to accept the user's name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hello $userName! Welcome to Kaizen, Fuel Your Motivation, Transform Your Life.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Space between text and button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExploreTopicsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Match button color
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Match padding
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Explore Topics',
                  style: TextStyle(color: Colors.white), // Ensure text color is white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
