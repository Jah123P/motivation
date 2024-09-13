import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart'; // Import the theme notifier
import 'account_screen.dart';
import 'privacy_screen.dart';
import 'help_support_screen.dart';
import 'user_model.dart'; // Import the user model

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final userModel = Provider.of<UserModel>(context); // Access user model

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).iconTheme.color),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Theme',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      // Optional: Handle theme settings when tapped
                    },
                  ),
                  SwitchListTile(
                    title: Text('Change App Theme'),
                    value: themeNotifier.isDarkMode,
                    onChanged: (value) {
                      themeNotifier.toggleTheme();
                    },
                    secondary: Icon(
                      themeNotifier.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      // Optional: Handle notifications settings when tapped
                    },
                  ),
                  SwitchListTile(
                    title: Text('Enable Daily Notifications'),
                    value: false, // Change to actual notification setting state
                    onChanged: (value) {
                      // Implement notification logic if needed
                    },
                    secondary: Icon(Icons.notifications, color: Theme.of(context).iconTheme.color),
                  ),
                ],
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Account'),
                subtitle: Text('Manage account details'),
                trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).iconTheme.color),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountScreen(), // No need to pass parameters
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                title: Text('Help & Support'),
                subtitle: Text('Get help and support'),
                trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).iconTheme.color),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpSupportScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
