import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard
import 'settings_screen.dart'; // Import the SettingsScreen

class DailyQuotesScreen extends StatefulWidget {
  final List<String> dailyQuotes;
  final List<String> favoritedQuotes;
  final Function(String) onFavoriteToggle;

  DailyQuotesScreen({
    required this.dailyQuotes,
    required this.favoritedQuotes,
    required this.onFavoriteToggle,
  });

  @override
  _DailyQuotesScreenState createState() => _DailyQuotesScreenState();
}

class _DailyQuotesScreenState extends State<DailyQuotesScreen> {
  late Set<String> favoritedQuotesSet;

  @override
  void initState() {
    super.initState();
    favoritedQuotesSet = Set.from(widget.favoritedQuotes);
  }

  void _copyToClipboard(String quote) {
    Clipboard.setData(ClipboardData(text: quote));
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
        title: Text('Daily Quotes', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Back button
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.dailyQuotes.isEmpty
            ? Center(
          child: Text(
            'No quotes available',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
            : PageView.builder(
          scrollDirection: Axis.vertical, // Scroll vertically for new quotes
          itemCount: widget.dailyQuotes.length,
          itemBuilder: (context, index) {
            final quote = widget.dailyQuotes[index];
            final isFavorited = favoritedQuotesSet.contains(quote);

            return Container(
              color: Colors.black, // Full black background for quotes
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          quote,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0), // Space between quote and buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite,
                              color: isFavorited ? Colors.red : Colors.white),
                          onPressed: () {
                            setState(() {
                              if (isFavorited) {
                                favoritedQuotesSet.remove(quote);
                              } else {
                                favoritedQuotesSet.add(quote);
                              }
                            });
                            widget.onFavoriteToggle(quote);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(isFavorited
                                      ? 'Quote removed from favorites'
                                      : 'Quote added to favorites')),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.copy, color: Colors.white), // Copy icon
                          onPressed: () => _copyToClipboard(quote), // Copy function
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
