import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard

class QuoteDetailScreen extends StatelessWidget {
  final String quote;
  final List<String> favoritedQuotes;
  final Function(String) onFavoriteToggle;

  QuoteDetailScreen({
    required this.quote,
    required this.favoritedQuotes,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isFavorited = favoritedQuotes.contains(quote);

    void _copyToClipboard() {
      Clipboard.setData(ClipboardData(text: quote));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Quote copied to clipboard')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black, // Full black background
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        title: Text('Quote Detail', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Pop the screen when back button is pressed
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                quote,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24, // Larger font size for emphasis
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Align the text center
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
                      // Call the callback function to toggle favorite status
                      onFavoriteToggle(quote);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(isFavorited
                              ? 'Quote removed from favorites'
                              : 'Quote added to favorites'),
                        ),
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
    );
  }
}
