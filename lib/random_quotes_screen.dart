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
        backgroundColor: widget.themeData.appBarTheme.backgroundColor ?? Color(0xFF1E293B), // Use themeData for background color
        title: Text('Quote', style: TextStyle(color: widget.themeData.textTheme.headlineLarge?.color ?? Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: widget.themeData.iconTheme.color ?? Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: widget.themeData.scaffoldBackgroundColor ?? Color(0xFF1E293B), // Use themeData for background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: widget.themeData.cardColor ?? Color(0xFF334155), // Use themeData for container color
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.quote,
                style: TextStyle(color: widget.themeData.textTheme.bodyLarge?.color ?? Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite, color: isFavorited ? Colors.red : widget.themeData.iconTheme.color ?? Colors.white),
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
                    icon: Icon(Icons.copy, color: widget.themeData.iconTheme.color ?? Colors.white), // Use themeData for icon color
                    onPressed: _copyToClipboard, // Updated function
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
