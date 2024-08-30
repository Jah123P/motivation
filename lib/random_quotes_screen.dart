import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard

class RandomQuotesScreen extends StatefulWidget {
  final String quote;
  final List<String> favoritedQuotes;
  final Function(String) onFavoriteToggle;

  RandomQuotesScreen({
    required this.quote,
    required this.favoritedQuotes,
    required this.onFavoriteToggle,
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
        backgroundColor: Color(0xFF1E293B), // Matching color with other screens
        title: Text('Quote', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFF1E293B), // Matching color with other screens
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color(0xFF334155), // Matching color with other screens
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.quote,
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite,
                        color: isFavorited ? Colors.red : Colors.white),
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
                    icon: Icon(Icons.copy, color: Colors.white), // Changed to copy icon
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
