import 'package:flutter/material.dart';
import 'base_screen.dart';

class ThankYouScreen extends StatelessWidget {
  final String name;

  // Constructor with required parameter
  ThankYouScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    // Navigate to BaseScreen after a delay
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BaseScreen(userName: name)),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank You $name For Signing Up With Us',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Colors.white), // Optional loading indicator
          ],
        ),
      ),
    );
  }
}
