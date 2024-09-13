import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the user model
    final userModel = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
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
            // Display user name
            Card(
              child: ListTile(
                title: Text('Name'),
                subtitle: Text(userModel.name ?? 'Not provided'),
                trailing: Icon(Icons.person, color: Theme.of(context).iconTheme.color),
              ),
            ),
            SizedBox(height: 10),
            // Display user age range
            Card(
              child: ListTile(
                title: Text('Age Range'),
                subtitle: Text(userModel.ageRange ?? 'Not provided'),
                trailing: Icon(Icons.cake, color: Theme.of(context).iconTheme.color),
              ),
            ),
            SizedBox(height: 20),
            Center(

              ),
          ],
        ),
      ),
    );
  }
}
