import 'package:flutter/material.dart';
import 'age_screen.dart'; // Import the age screen

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title
            Text(
              "Welcome to Kaizen",
              style: TextStyle(
                fontSize: screenSize.width * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            // Info Section
            Column(
              children: [
                _buildFeatureItem(
                  context,
                  Icons.design_services, // Use a relevant icon
                  "Daily Motivation",
                  "Stay inspired with curated quotes and empowering features.",
                ),
                SizedBox(height: screenSize.height * 0.03), // Spacing between features
                _buildFeatureItem(
                  context,
                  Icons.collections,
                  "Handpicked by Experts",
                  "Discover content designed by motivational speakers and leaders.",
                ),
                SizedBox(height: screenSize.height * 0.03),
                _buildFeatureItem(
                  context,
                  Icons.settings,
                  "Personalize Your Journey",
                  "Tailor the app to align with your goals and aspirations.",
                ),
              ],
            ),
            // Continue Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.02,
                  horizontal: screenSize.width * 0.3,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: screenSize.width * 0.05),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for building each feature item
  Widget _buildFeatureItem(BuildContext context, IconData icon, String title, String description) {
    final Size screenSize = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blueAccent, size: screenSize.width * 0.08),
        SizedBox(width: screenSize.width * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenSize.width * 0.05,
                ),
              ),
              SizedBox(height: screenSize.height * 0.005),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: screenSize.width * 0.04,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
