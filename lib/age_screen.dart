import 'package:flutter/material.dart';
import 'name_screen.dart'; // Import the next screen

class AgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How old are you?',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _ageOption(context, '13 to 17'),
              _ageOption(context, '18 to 24'),
              _ageOption(context, '25 to 34'),
              _ageOption(context, '35 to 44'),
              _ageOption(context, '45+'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ageOption(BuildContext context, String ageRange) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NameScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Use the same color as the intro button
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Match padding
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(ageRange, style: TextStyle(color: Colors.white)), // Set button text color to white
      ),
    );
  }
}
