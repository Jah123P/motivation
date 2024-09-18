import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
import 'thank_you_screen.dart';

class NameScreen extends StatefulWidget {
  final String ageRange;

  NameScreen({required this.ageRange});

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text;
      if (text.isNotEmpty) {
        final newText = text[0].toUpperCase() + text.substring(1);
        if (newText != text) {
          _controller.value = _controller.value.copyWith(
            text: newText,
            selection: TextSelection.fromPosition(
              TextPosition(offset: newText.length),
            ),
            composing: TextRange.empty,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // Get screen size

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What should we call you?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * 0.06, // Responsive text size
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.05), // Responsive spacing
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.white54),
                  errorText: _errorText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Color(0xFF334155), // Same fill color as before
                ),
                style: TextStyle(color: Colors.white),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                ],
              ),
              SizedBox(height: screenSize.height * 0.05),
              ElevatedButton(
                onPressed: () {
                  _validateInput(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Same blue color
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.02,
                    horizontal: screenSize.width * 0.1,
                  ), // Button padding consistent with previous screens
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  textStyle: TextStyle(
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateInput(BuildContext context) {
    setState(() {
      String enteredName = _controller.text.trim();

      if (enteredName.isEmpty) {
        _errorText = 'Please enter your name';
      } else if (enteredName.length < 3) {
        _errorText = 'Name must be at least 3 characters long';
      } else if (RegExp(r'[0-9]').hasMatch(enteredName)) {
        _errorText = 'Numbers are not allowed';
      } else {
        _errorText = null;

        // Update the user data in UserModel
        Provider.of<UserModel>(context, listen: false).updateUserName(enteredName);
        Provider.of<UserModel>(context, listen: false).updateUserAgeRange(widget.ageRange);

        // Navigate to ThankYouScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ThankYouScreen(
              name: enteredName,
              ageRange: widget.ageRange,
            ),
          ),
        );
      }
    });
  }
}
