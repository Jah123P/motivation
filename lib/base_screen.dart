import 'package:flutter/material.dart';
import 'explore_topics_screen.dart'; // Import the ExploreTopicsScreen
import 'package:shared_preferences/shared_preferences.dart'; // Import for data saving

class BaseScreen extends StatelessWidget {
  final String userName; // Add a variable to hold the user's name
  final String userAgeRange; // Add a variable to hold the user's age range

  BaseScreen({required this.userName, required this.userAgeRange}); // Constructor to accept the user's name and age range

  @override
  Widget build(BuildContext context) {
    _saveUserData(); // Save user data when the screen is built

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

  void _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName); // Save the user's name
    await prefs.setString('userAgeRange', userAgeRange); // Save the user's age range
  }
}
