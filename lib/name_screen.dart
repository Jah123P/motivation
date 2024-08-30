import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter
import 'theme_screen.dart';

class NameScreen extends StatefulWidget {
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    // Add listener to capitalize the first letter
    _controller.addListener(() {
      final text = _controller.text;
      if (text.isNotEmpty) {
        // Capitalize the first letter
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What should we call you?',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.white54),
                  errorText: _errorText, // Display error text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Color(0xFF334155),
                ),
                style: TextStyle(color: Colors.white),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only letters and spaces
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _validateInput(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Match button color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Match padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, color: Colors.white),
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

      // Validate the input
      if (enteredName.isEmpty) {
        _errorText = 'Please enter your name';
      } else if (enteredName.length < 3) {
        _errorText = 'Name must be at least 3 characters long';
      } else if (RegExp(r'[0-9]').hasMatch(enteredName)) {
        _errorText = 'Numbers are not allowed';
      } else {
        _errorText = null;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThemeScreen(userName: enteredName), // Pass the user's name to ThemeScreen
          ),
        );
      }
    });
  }
}
