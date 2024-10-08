import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuotesScreen extends StatefulWidget {
  final List<String> quotes;
  final List<String> favoritedQuotes;
  final Function(String) onFavoriteToggle;

  QuotesScreen({
    required this.quotes,
    required this.favoritedQuotes,
    required this.onFavoriteToggle,
  });

  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
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
        backgroundColor: Colors.black,
        title: Text('Quotes', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: widget.quotes.length,
          itemBuilder: (context, index) {
            final quote = widget.quotes[index];
            final isFavorited = favoritedQuotesSet.contains(quote);

            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF334155),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quote,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite, color: isFavorited ? Colors.red : Colors.white),
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
                            SnackBar(content: Text(isFavorited
                                ? 'Quote removed from favorites'
                                : 'Quote added to favorites')),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.copy, color: Colors.white),
                        onPressed: () {
                          _copyToClipboard(quote);
                        },
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
