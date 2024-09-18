import 'package:flutter/material.dart';
import 'QuoteDetailScreen.dart';

class MyFavoritesScreen extends StatelessWidget {
  final List<String> favoritedQuotes;
  final Function(String) onFavoriteToggle;

  MyFavoritesScreen({
    required this.favoritedQuotes,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Consistent background color
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text('My Favorites', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)), // Updated text style
        centerTitle: true,
      ),
      body: favoritedQuotes.isEmpty
          ? Center(
        child: Text(
          'No favorites yet',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: favoritedQuotes.length,
        itemBuilder: (context, index) {
          return _buildFavoriteTile(context, favoritedQuotes[index]);
        },
      ),
    );
  }

  Widget _buildFavoriteTile(BuildContext context, String quote) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFF1E293B), // Updated background color for the card
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          quote,
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500), // Improved text style
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios, color: Colors.white), // Icon to indicate navigation
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuoteDetailScreen(
                  quote: quote,
                  favoritedQuotes: favoritedQuotes,
                  onFavoriteToggle: onFavoriteToggle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
