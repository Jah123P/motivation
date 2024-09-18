import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('App Name'),
                    subtitle: Text('Kaizen'),
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text('support@kaizenapp.com'),
                    onTap: () {
                      // Optional: Handle email tap
                    },
                  ),
                  ListTile(
                    title: Text('Phone'),
                    subtitle: Text('+1 (555) 123-4567'),
                  ),
                  ListTile(
                    title: Text('Website'),
                    subtitle: Text(
                      'www.kaizenapp.com',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onTap: () {
                      // Optional: Handle website tap
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Contact support functionality
              },
              child: Center(
                child: Text('Contact Support'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
