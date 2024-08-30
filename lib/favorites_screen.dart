import 'package:flutter/material.dart';
import 'favorite_quotes_manager.dart'; // Ensure correct path to the manager

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E293B), // Matching color with other screens
      appBar: AppBar(
        backgroundColor: Color(0xFF334155), // Matching color with other screens
        title: Text('My Favorites', style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<String>>(
        future: _getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No favorite quotes', style: TextStyle(color: Colors.white)));
          }
          final favorites = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return _buildFavoriteCard(favorites[index]);
            },
          );
        },
      ),
    );
  }

  Future<List<String>> _getFavorites() async {
    final manager = FavoriteQuotesManager();
    return await manager.getFavorites();
  }

  Widget _buildFavoriteCard(String quote) {
    return Card(
      color: Color(0xFF334155), // Matching color with other screens
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          quote,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
