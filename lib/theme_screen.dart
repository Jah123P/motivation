import 'package:flutter/material.dart';
import 'thank_you_screen.dart'; // Import the ThankYouScreen

class ThemeScreen extends StatefulWidget {
  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  Color backgroundColor = Colors.black;
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select A Theme',
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  backgroundColor = Colors.white;
                  textColor = Colors.black;
                });
              },
              onExit: (_) {
                setState(() {
                  backgroundColor = Colors.black;
                  textColor = Colors.white;
                });
              },
              child: ElevatedButton(
                onPressed: () {
                  _navigateToThankYouScreen(context);
                  // Set the theme globally if needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Light Theme',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _navigateToThankYouScreen(context);
                // Set the theme globally if needed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Dark Theme',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToThankYouScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThankYouScreen(
          name: '', ageRange: '', // Empty name as there's no data to pass
        ),
      ),
    );
  }
}
