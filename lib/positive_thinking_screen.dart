import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard

class PositiveThinkingScreen extends StatefulWidget {
  final List<String> positiveQuotes;
  final List<String> favoritedQuotes;
  final Function(String) onFavoriteToggle;

  PositiveThinkingScreen({
    required this.positiveQuotes,
    required this.favoritedQuotes,
    required this.onFavoriteToggle,
  });

  @override
  _PositiveThinkingScreenState createState() => _PositiveThinkingScreenState();
}

class _PositiveThinkingScreenState extends State<PositiveThinkingScreen> {
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
      appBar: AppBar(
        backgroundColor: Color(0xFF1E293B), // Matching color with other screens
        title: Text('Positive Thinking', style: TextStyle(color: Colors.white)),
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
        child: widget.positiveQuotes.isEmpty
            ? Center(
          child: Text(
            'No quotes available',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
            : PageView.builder(
          scrollDirection: Axis.vertical, // Scroll vertically for new quotes
          itemCount: widget.positiveQuotes.length,
          itemBuilder: (context, index) {
            final quote = widget.positiveQuotes[index];
            final isFavorited = favoritedQuotesSet.contains(quote);

            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF334155), // Matching color with other screens
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out content
                children: [
                  // Quote text at the top
                  Expanded(
                    child: Center(
                      child: Text(
                        quote,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0), // Space between quote and buttons

                  // Like and Copy buttons centered at the bottom of the quote
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
            );
          },
        ),
      ),
    );
  }
}
