import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard

class RandomQuotesScreen extends StatefulWidget {
  final String quote;
  final List<String> favoritedQuotes;
  final Function(String) onFavoriteToggle;
  final ThemeData themeData;

  RandomQuotesScreen({
    required this.quote,
    required this.favoritedQuotes,
    required this.onFavoriteToggle,
    required this.themeData,
  });

  @override
  _RandomQuotesScreenState createState() => _RandomQuotesScreenState();
}

class _RandomQuotesScreenState extends State<RandomQuotesScreen> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.favoritedQuotes.contains(widget.quote);
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.quote));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Quote copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Full black background
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        title: Text('Random Quotes', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Pop the screen when back button is pressed
          },
        ),
      ),
      body: Container(
        color: Colors.black, // Ensure the background stays black
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.quote,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24, // Larger font size for emphasis
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Align the text center here
                ),
                SizedBox(height: 16.0), // Spacing between text and buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: isFavorited ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorited = !isFavorited;
                        });
                        widget.onFavoriteToggle(widget.quote);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(isFavorited
                              ? 'Quote added to favorites'
                              : 'Quote removed from favorites')),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.copy, color: Colors.white),
                      onPressed: _copyToClipboard,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
