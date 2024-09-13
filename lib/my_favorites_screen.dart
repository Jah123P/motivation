import 'package:flutter/material.dart';
import 'random_quotes_screen.dart';

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
      backgroundColor: Color(0xFF1E293B), // Consistent background color
      appBar: AppBar(
        backgroundColor: Color(0xFF334155), // Consistent AppBar color
        elevation: 0, // Match elevation
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Consistent icon color
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('My Favorites', style: TextStyle(color: Colors.white)),
        centerTitle: true, // Consistent text style
      ),
      body: favoritedQuotes.isEmpty
          ? Center(
        child: Text(
          'No favorites yet',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16.0), // Consistent padding
        itemCount: favoritedQuotes.length,
        itemBuilder: (context, index) {
          return _buildFavoriteTile(context, favoritedQuotes[index]);
        },
      ),
    );
  }

  Widget _buildFavoriteTile(BuildContext context, String quote) {
    return Card(
      color: Color(0xFF334155), // Consistent card color
      margin: EdgeInsets.symmetric(vertical: 8.0), // Consistent margin
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0), // Consistent padding
        title: Text(
          quote,
          style: TextStyle(color: Colors.white, fontSize: 16), // Consistent text style
        ),
      ),
    );
  }
}
