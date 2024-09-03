import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart'; // Import the theme notifier
import 'explore_topics_screen.dart'; // Import the explore topics screen
import 'favorite_quotes_manager.dart'; // Import the favorite quotes manager

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized

  // Initialize the database or perform other startup tasks here
  final FavoriteQuotesManager favoriteQuotesManager = FavoriteQuotesManager();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: MyApp(favoriteQuotesManager: favoriteQuotesManager),
    ),
  );
}

class MyApp extends StatelessWidget {
  final FavoriteQuotesManager favoriteQuotesManager;

  MyApp({required this.favoriteQuotesManager});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: 'Motivation App',
          theme: themeNotifier.currentTheme,
          debugShowCheckedModeBanner: false, // Remove the debug banner
          home: FutureBuilder<List<String>>(
            future: favoriteQuotesManager.getFavorites(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ExploreTopicsScreen(); // Pass any data if needed
                } else {
                  return Center(child: Text('No favorites found.'));
                }
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }
}
