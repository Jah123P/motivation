import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
import 'name_screen.dart';

class AgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Keep the dark background for consistency
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How old are you?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24, // Keep font size as in the original version
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Space between title and buttons
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
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Vertical spacing between buttons
      child: ElevatedButton(
        onPressed: () {
          // Update the age range in the UserModel using Provider
          Provider.of<UserModel>(context, listen: false).updateUserAgeRange(ageRange);

          // Navigate to the NameScreen and pass the selected age range
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NameScreen(ageRange: ageRange),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent, // Maintain the blue background
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Same padding as original version
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners for consistency
          ),
          textStyle: TextStyle(
            fontSize: 16, // Same font size as original version
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(ageRange, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
