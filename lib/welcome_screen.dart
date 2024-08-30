import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // For scheduling the navigation

class WelcomeScreen extends StatefulWidget {
  final String name;

  WelcomeScreen({required this.name});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the ThankYouScreen after a delay
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ThankYouScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Use your desired color
      body: Center(
        child: Text(
          'Welcome ${widget.name}',
          style: TextStyle(color: Colors.white, fontSize: 24), // Adjust as needed
        ),
      ),
    );
  }
}

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Use your desired color
      body: Center(
        child: Text(
          'Thank you for signing up with us, Please wait...',
          style: TextStyle(color: Colors.white, fontSize: 24), // Adjust as needed
        ),
      ),
    );
  }
}
