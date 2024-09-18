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
    "The only limit to our realization of tomorrow is our doubts of today.",
    "Life is what happens when you're busy making other plans.",
    "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.",
    "In three words I can sum up everything I've learned about life: it goes on.",
    "The purpose of our lives is to be happy.",
    "Get your facts first, then you can distort them as you please.",
    "Life is really simple, but we insist on making it complicated.",
    "The only way to do great work is to love what you do.",
    "You have within you right now, everything you need to deal with whatever the world can throw at you.",
    "The best way to predict your future is to create it.",
    "Happiness is not something ready made. It comes from your own actions.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "Your time is limited, don't waste it living someone else's life.",
    "Life is short, and it is up to you to make it sweet.",
    "Act as if what you do makes a difference. It does.",
    "The only impossible journey is the one you never begin.",
    "You must be the change you wish to see in the world.",
    "Believe you can and you're halfway there.",
    "The best revenge is massive success.",
    "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
  ];


  final List<String> dailyQuotes = [
    "Every day may not be good, but there's something good in every day.",
    "Believe you can and you're halfway there.",
    "Act as if what you do makes a difference. It does.",
    "Start each day with a grateful heart.",
    "Today is a new beginning. Embrace it with open arms.",
    "The only way to do great work is to love what you do.",
    "Make today so awesome that yesterday gets jealous.",
    "Every day is a second chance.",
    "Your future is created by what you do today, not tomorrow.",
    "The best time for new beginnings is now."
  ];


  final List<String> loveQuotes = [
    "Love is not about how many days, months, or years you have been together. Love is about how much you love each other every single day.",
    "Love is not something you find. Love is something that finds you.",
    "The best thing to hold onto in life is each other.",
    "Love is a friendship set to music.",
    "To love and be loved is to feel the sun from both sides.",
    "In your smile, I see my favorite place.",
    "Every moment spent with you is like a beautiful dream come true.",
    "True love is not about perfection; it is hidden in flaws.",
    "You are my today and all of my tomorrows.",
    "Love is a language spoken by everyone but understood only by the heart."
  ];


  final List<String> selfCareQuotes = [
    "Self-care is not selfish. You cannot serve from an empty vessel.",
    "Almost everything will work again if you unplug it for a few minutes, including you.",
    "Self-care is giving the world the best of you, instead of what’s left of you.",
    "You can’t pour from an empty cup. Take care of yourself first.",
    "Self-care is how you take your power back.",
    "Taking care of yourself doesn’t mean me first, it means me too.",
    "Self-care is not a luxury; it’s a necessity.",
    "You owe yourself the love that you so freely give to others.",
    "Rest and self-care are so important. When you take time to replenish your spirit, it allows you to serve others from the overflow.",
    "Caring for myself is not self-indulgence, it is self-preservation."
  ];


  final List<String> patienceQuotes = [
    "Patience is not simply the ability to wait – it’s how we behave while we’re waiting.",
    "Patience is the companion of wisdom.",
    "The two most powerful warriors are patience and time.",
    "Patience is a virtue, and I'm learning patience. It's a tough lesson.",
    "All things come to those who wait.",
    "Patience is the key to contentment.",
    "The greatest power is often simple patience.",
    "In the end, patience and persistence will overcome all challenges.",
    "Have patience. All things are difficult before they become easy.",
    "Patience is the art of hoping."
  ];


  final List<String> deepQuotes = [
    "The only way to deal with an unfree world is to become so absolutely free that your very existence is an act of rebellion.",
    "We are all in the gutter, but some of us are looking at the stars.",
    "In the end, we will remember not the words of our enemies, but the silence of our friends.",
    "The unexamined life is not worth living.",
    "The more I see, the less I know for sure.",
    "The mind is everything. What you think you become.",
    "He who has a why to live can bear almost any how.",
    "We do not remember days; we remember moments.",
    "Life is really simple, but we insist on making it complicated.",
    "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.",
  ];


  final List<String> positiveQuotes = [
    "The only limit to our realization of tomorrow is our doubts of today.",
    "Every day may not be good, but there is something good in every day.",
    "Believe you can and you’re halfway there.",
    "Positivity is not about expecting the best to happen, but accepting that whatever happens is the best for the moment.",
    "The sun has to set to rise again.",
    "Happiness is not by chance, but by choice.",
    "Start each day with a grateful heart.",
    "Your vibe attracts your tribe.",
    "The only way to achieve the impossible is to believe it is possible.",
    "Surround yourself with positive people and you’ll be a positive person.",
    "When you focus on the good, the good gets better.",
    "Difficulties in life are intended to make us better, not bitter."
  ];


  final List<String> designedForYouQuotes = [
    "The only limit to our realization of tomorrow is our doubts of today. – Franklin D. Roosevelt",
    "Do not wait to strike till the iron is hot, but make it hot by striking. – William Butler Yeats",
    "The best revenge is massive success. – Frank Sinatra",
    "Success usually comes to those who are too busy to be looking for it. – Henry David Thoreau",
    "The future belongs to those who believe in the beauty of their dreams. – Eleanor Roosevelt",
    "Your time is limited, don't waste it living someone else's life. – Steve Jobs",
    "What lies behind us and what lies before us are tiny matters compared to what lies within us. – Ralph Waldo Emerson",
    "Act as if what you do makes a difference. It does. – William James",
    "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful. – Albert Schweitzer",
    "Believe you can and you're halfway there. – Theodore Roosevelt"
  ];


  final List<String> sadnessQuotes = [
    "Even the darkest night will end and the sun will rise.",
    "The pain you feel today is the strength you gain tomorrow.",
    "Sometimes, the heart needs to grieve to make room for new happiness.",
    "Tears are the silent language of grief.",
    "In the middle of difficulty lies opportunity.",
    "The scars you share become lighthouses for other people who are headed to the same rocks you hit.",
    "It's okay to be a work in progress; healing is a journey.",
    "The sun will set and rise again, no matter how dark the night.",
    "You are allowed to be both a masterpiece and a work in progress simultaneously.",
    "Healing is not linear; it's a dance between embracing the pain and finding joy."
  ];


  final List<String> sigmaQuotes = [
    "A sigma is not defined by trends but by their ability to redefine them. – Jaheem Grange",
    "True power is the strength to stand alone, unshaken by the world. – Paul Holding",
    "Mastery over oneself is the highest form of power and control. – Jahlani",
    "A sigma’s worth is internal; validation from others is irrelevant. – Jaheem Grange",
    "Real strength comes from within, beyond the grasp of external validation. – Sukuna",
    "Silence is the sigma’s ultimate declaration of dominance. – Unknown Sigma",
    "The true measure of strength is not in what you can endure but in what you overcome. – Paul Holding",
    "A sigma thrives in their solitude, using it as a tool for unparalleled personal growth. – Demario",
    "Success for a sigma is about self-respect, not external approval. – Paul Holding",
    "A sigma’s journey is paved with resilience, not swayed by the opinions of others. – Ichigo",
    "To be a sigma is to be a lone wolf, powerful and unapologetic. – Gojo Satoru",
    "The sigma knows that the only validation needed is from their own reflection. – Jaheem Grange"
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
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, color: Colors.white),
            onSelected: (String value) {
              if (value == 'Favorites') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyFavoritesScreen(
                    favoritedQuotes: favoritedQuotes,
                    onFavoriteToggle: _toggleFavorite,
                  )),
                );
              } else if (value == 'Settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Favorites',
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Favorites'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Settings',
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: Colors.green),
                      SizedBox(width: 8),
                      Text('Settings'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: filteredTopics.length,
                itemBuilder: (context, index) {
                  return _buildTopicCard(filteredTopics[index]);
                },
              ),
            ),
            if (_isPanelVisible) ...[
              // Your panel content here, if needed
              Container(
                color: Color(0xFF1E293B),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Additional Panel Content',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // Add more widgets here as needed
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTopicCard(String topic) {
    String imagePath;

    switch (topic) {
      case 'Random Quotes':
        imagePath = 'assets/images/dice.png';
        break;
      case 'Daily Quotes':
        imagePath = 'assets/images/sun.png'; // Use correct image
        break;
      case 'Designed For YOU':
        imagePath = 'assets/images/brain.png'; // Use correct image
        break;
      case 'Positive Thinking':
        imagePath = 'assets/images/positive.png'; // Use correct image
        break;
      case 'Deep':
        imagePath = 'assets/images/deep.png';
        break;
      case 'Love':
        imagePath = 'assets/images/love.png';
        break;
      case 'Self-care':
        imagePath = 'assets/images/selfcare.png'; // Ensure filename matches
        break;
      case 'Patience':
        imagePath = 'assets/images/patience.png';
        break;
      case 'Sadness Quotes':
        imagePath = 'assets/images/sad.png'; // Ensure filename matches
        break;
      case 'Sigma':
        imagePath = 'assets/images/sigma.png';
        break;
      default:
        imagePath = 'assets/images/default.png'; // Fallback image
    }

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
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                topic,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
