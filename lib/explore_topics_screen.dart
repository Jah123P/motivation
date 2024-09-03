import 'package:flutter/material.dart';
import 'package:motivation/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'dart:async'; // Import for Timer
import 'random_quotes_screen.dart';
import 'daily_quotes_screen.dart';
import 'my_favorites_screen.dart';
import 'designed_for_you_screen.dart';
import 'positive_thinking_screen.dart';
import 'deep_quotes_screen.dart';
import 'love_quotes_screen.dart';
import 'self_care_quotes_screen.dart';
import 'patience_quotes_screen.dart';
import 'sadness_quotes_screen.dart';
import 'sigma_quotes_screen.dart'; // Import the new screen
import 'settings_screen.dart'; // Import the settings screen

class ExploreTopicsScreen extends StatefulWidget {
  @override
  _ExploreTopicsScreenState createState() => _ExploreTopicsScreenState();
}

class _ExploreTopicsScreenState extends State<ExploreTopicsScreen> {
  List<String> allTopics = [
    "Random Quotes",
    "Daily Quotes",
    "Designed For YOU",
    "Positive Thinking",
    "Deep",
    "Love",
    "Self-care",
    "Patience",
    "Sadness Quotes",
    "Sigma" // Add new topic here
  ];
  List<String> filteredTopics = [];
  List<String> favoritedQuotes = [];
  bool _isPanelVisible = false; // Track the visibility of the panel

  final List<String> randomQuotes = [
    "You are capable of more than you know.",
    "Believe in yourself and all that you are.",
    "You are braver than you believe, stronger than you seem, and smarter than you think.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "The best way to predict the future is to invent it.",
  ];

  final List<String> dailyQuotes = [
    "Every day may not be good, but there's something good in every day.",
    "Believe you can and you're halfway there.",
    "Act as if what you do makes a difference. It does."
  ];

  final List<String> loveQuotes = [
    "Love is not about how many days, months, or years you have been together. Love is about how much you love each other every single day.",
    "Love is not something you find. Love is something that finds you.",
    "The best thing to hold onto in life is each other.",
    "Love is a friendship set to music.",
    "To love and be loved is to feel the sun from both sides."
  ];

  final List<String> selfCareQuotes = [
    "Self-care is not selfish. You cannot serve from an empty vessel.",
    "Almost everything will work again if you unplug it for a few minutes, including you.",
    "Self-care is giving the world the best of you, instead of what’s left of you.",
    "You can’t pour from an empty cup. Take care of yourself first.",
    "Self-care is how you take your power back."
  ];

  final List<String> patienceQuotes = [
    "Patience is not simply the ability to wait – it’s how we behave while we’re waiting.",
    "Patience is the companion of wisdom.",
    "The two most powerful warriors are patience and time."
  ];

  final List<String> deepQuotes = [
    "Deep quotes to ponder.",
    "The deeper you go, the more you learn.",
    "Understanding comes with time and reflection."
  ];

  final List<String> positiveQuotes = [
    "Stay positive, work hard, and make it happen.",
    "Positive thoughts bring positive results.",
    "Keep your face to the sunshine and you cannot see a shadow."
  ];

  final List<String> designedForYouQuotes = [
    "The only way to do great work is to love what you do. – Steve Jobs",
    "In the end, we will remember not the words of our enemies, but the silence of our friends. – Martin Luther King Jr.",
    "You must be the change you wish to see in the world. – Mahatma Gandhi",
    "Success is not final, failure is not fatal: It is the courage to continue that counts. – Winston Churchill",
    "The best way to predict the future is to invent it. – Alan Kay"
  ];

  final List<String> sadnessQuotes = [
    "The pain you feel today is the strength you feel tomorrow.",
    "Tears are words the heart can't express.",
    "Sometimes, the only way to be heard is to speak through your tears.",
    "Sadness flies away on the wings of time.",
    "In the end, we will remember not the words of our enemies, but the silence of our friends.",
    "The heart was made to be broken.",
    "It's okay to be a glowstick; sometimes we need to break before we shine.",
    "The darkest hour has only sixty minutes.",
    "Sometimes, the hardest part isn't letting go but learning to start over.",
    "When you are sorrowful, look again in your heart, and you shall see that in truth you are weeping for that which has been your delight."
  ];

  final List<String> sigmaQuotes = [
    "A true sigma knows their worth and doesn’t seek validation from others.",
    "Strength doesn’t come from what you can do; it comes from overcoming the things you once thought you couldn’t.",
    "Sometimes you have to stand alone to prove that you can still stand.",
    "Silence is a source of great strength.",
    "The strongest people are those who don’t need validation from others.",
    "A sigma is a lone wolf who knows their own strength."
  ];

  Timer? _timer;
  String _currentRandomQuote = "";

  @override
  void initState() {
    super.initState();
    filteredTopics = List.from(allTopics);
    _currentRandomQuote = _getRandomQuote();
    _startQuoteTimer();
  }

  void _startQuoteTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      setState(() {
        _currentRandomQuote = _getRandomQuote();
      });
    });
  }

  String _getRandomQuote() {
    final randomIndex = (randomQuotes.length * (DateTime
        .now()
        .millisecondsSinceEpoch / 1000 % 1)).toInt();
    return randomQuotes[randomIndex % randomQuotes.length];
  }

  void _filterTopics(String query) {
    setState(() {
      filteredTopics = allTopics
          .where((topic) => topic.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleFavorite(String quote) {
    setState(() {
      if (favoritedQuotes.contains(quote)) {
        favoritedQuotes.remove(quote);
      } else {
        favoritedQuotes.add(quote);
      }
    });
  }

  void _togglePanel() {
    setState(() {
      _isPanelVisible = !_isPanelVisible;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final themeData = themeNotifier.currentTheme;
    return Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor, // Use scaffoldBackgroundColor for background color
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF1E293B),
    elevation: 0,
    title: Text('Explore Topics', style: TextStyle(color: Colors.white)),
    centerTitle: true,
    ),
    body: Stack(
    children: [
    Padding(
    padding: const EdgeInsets.all
      (8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          TextField(
            onChanged: _filterTopics,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search topics",
              hintStyle: TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Color(0xFF334155),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: filteredTopics.length,
              itemBuilder: (context, index) {
                final topic = filteredTopics[index];
                return _buildTopicCard(topic);
              },
            ),
          ),
        ],
      ),
    ),
      Positioned(
        bottom: 25,
        right: 120,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(
              opacity: _isPanelVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Container(
                width: 160,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF2D3748),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black54, blurRadius: 8)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.favorite, color: Colors.red),
                      title: Text("Favorites", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyFavoritesScreen(favoritedQuotes: favoritedQuotes, onFavoriteToggle: (String quote) { _toggleFavorite(quote); })),
                        );
                      },
                    ),
                    Divider(color: Colors.white24),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.settings, color: Colors.green),
                      title: Text("Settings", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            FloatingActionButton(
              backgroundColor: Color(0xFF1E293B),
              child: Icon(_isPanelVisible ? Icons.close : Icons.menu, color: Colors.white),
              onPressed: _togglePanel,
            ),
          ],
        ),
      ),
    ],
    ),
    );
  }

  Widget _buildTopicCard(String topic) {
    return GestureDetector(
      onTap: () {
        Widget screen;

        switch (topic) {
          case 'Random Quotes':
            screen = RandomQuotesScreen(
              quote: _currentRandomQuote,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
              themeData: Theme.of(context), // Pass the themeData here
            );
            break;

          case 'Daily Quotes':
            screen = DailyQuotesScreen(
              dailyQuotes: dailyQuotes,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'Designed For YOU':
            screen = DesignedForYouScreen(
              quotes: designedForYouQuotes,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'Positive Thinking':
            screen = PositiveThinkingScreen(
              positiveQuotes: positiveQuotes,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'Deep':
            screen = DeepQuotesScreen(
              deepQuotes: deepQuotes,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'Love':
            screen = LoveQuotesScreen(
              loveQuotes: loveQuotes,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'Self-care':
            screen = SelfCareQuotesScreen(
              selfCareQuotes: selfCareQuotes,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'Patience':
            screen = PatienceQuotesScreen(
              patienceQuotes: patienceQuotes,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'Sadness Quotes':
            screen = SadnessQuotesScreen(
              sadnessQuotes: sadnessQuotes,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'Sigma':
            screen = SigmaQuotesScreen(
              sigmaQuotes: sigmaQuotes,
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'My Favorites':
            screen = MyFavoritesScreen(
              favoritedQuotes: favoritedQuotes,
              onFavoriteToggle: _toggleFavorite,
            );
            break;
          case 'Settings':
            screen = SettingsScreen();
            break;
          default:
            screen = Container(); // Default case if needed
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        color: Color(0xFF334155),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            topic,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
