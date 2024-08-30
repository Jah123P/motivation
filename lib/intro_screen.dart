import 'package:flutter/material.dart';
import 'age_screen.dart'; // Import the age screen

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05, // Horizontal padding proportional to screen width
            vertical: screenSize.height * 0.1, // Vertical padding proportional to screen height
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Kaizen',
                style: TextStyle(
                  fontSize: screenSize.width * 0.06, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to white
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.05), // Responsive spacing
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AgeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.02, // Responsive vertical padding
                    horizontal: screenSize.width * 0.1, // Responsive horizontal padding
                  ),
                  textStyle: TextStyle(
                    fontSize: screenSize.width * 0.05, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded button
                  ),
                ),
                child: Text(
                  'Begin Your Journey',
                  style: TextStyle(color: Colors.white), // Set button text color to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
