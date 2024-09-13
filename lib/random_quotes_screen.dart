import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard

class RandomQuotesScreen extends StatefulWidget {
  final String quote;
  final List<String> favoritedQuotes;
  final Function(String) onFavoriteToggle;
  final ThemeData themeData; // Add themeData parameter

  RandomQuotesScreen({
    required this.quote,
    required this.favoritedQuotes,
    required this.onFavoriteToggle,
    required this.themeData, // Initialize themeData
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
      appBar: AppBar(
        backgroundColor: Color(0xFF1E293B), // Match the color with SigmaQuotesScreen
        title: Text('Random Quote', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFF1E293B), // Match the color with SigmaQuotesScreen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFF334155), // Match the color with SigmaQuotesScreen
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjusts the height to content
              children: [
                Text(
                  widget.quote,
                  style: TextStyle(color: Colors.white, fontSize: 18), // Adjusted font size
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0), // Adjusted spacing to match SigmaQuotesScreen
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: isFavorited ? Colors.red : Colors.white,
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
                      icon: Icon(Icons.copy, color: Colors.white), // Consistent icon color
                      onPressed: _copyToClipboard, // Updated function
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
