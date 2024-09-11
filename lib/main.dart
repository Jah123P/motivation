import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_notifier.dart';
import 'explore_topics_screen.dart';
import 'favorite_quotes_manager.dart';
import 'intro_screen.dart';
import 'user_model.dart'; // Import the UserModel

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final introCompleted = prefs.getBool('introCompleted') ?? false;

  final FavoriteQuotesManager favoriteQuotesManager = FavoriteQuotesManager();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => UserModel()), // Provide the UserModel
      ],
      child: MyApp(
        favoriteQuotesManager: favoriteQuotesManager,
        introCompleted: introCompleted,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final FavoriteQuotesManager favoriteQuotesManager;
  final bool introCompleted;

  MyApp({required this.favoriteQuotesManager, required this.introCompleted});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: 'Motivation App',
          theme: themeNotifier.currentTheme,
          debugShowCheckedModeBanner: false,
          home: introCompleted ? ExploreTopicsScreen() : IntroScreen(),
        );
      },
    );
  }
}
