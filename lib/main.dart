import 'package:flutter/material.dart';
import 'package:motivation/explore_topics_screen.dart';
import 'intro_screen.dart'; // Import the intro screen
import 'age_screen.dart'; // Import the age screen
import 'global.dart'; // Import the global list for favorited quotes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivation App',
      theme: ThemeData.dark(), // Default to dark theme
      home: IntroScreen(),
    );
  }
}
