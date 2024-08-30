import 'package:shared_preferences/shared_preferences.dart';

class FavoriteQuotesManager {
  static const String _favoritesKey = 'favoriteQuotes';

  // Retrieve the list of favorite quotes
  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  // Add a quote to the favorites list
  Future<void> addFavorite(String quote) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavorites();
    if (!favorites.contains(quote)) {
      favorites.add(quote);
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }

  // Remove a quote from the favorites list
  Future<void> removeFavorite(String quote) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavorites();
    if (favorites.contains(quote)) {
      favorites.remove(quote);
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }

  // Check if a quote is in the favorites list
  Future<bool> isFavorite(String quote) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavorites();
    return favorites.contains(quote);
  }
}
