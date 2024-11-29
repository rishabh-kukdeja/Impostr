import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CrimeTrace'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Implement menu functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track Fake Accounts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Search by Username
            TextField(
              decoration: InputDecoration(
                labelText: 'Search by Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Search by Account Details
            TextField(
              decoration: InputDecoration(
                labelText: 'Search by Account Details',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Fake Account Cards
            FakeAccountCard(
              username: 'fake_account123',
              platform: 'Instagram',
              status: 'Under Investigation',
              onInvestigate: () {
                // Handle Investigate action
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Investigate'),
                      content: Text('Investigating fake_account123...'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            FakeAccountCard(
              username: 'spam_bot567',
              platform: 'Twitter',
              status: 'Verified Fake',
              onTakeDown: () {
                // Handle Take Down action
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Take Down'),
                      content: Text('Taking down spam_bot567...'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FakeAccountCard extends StatelessWidget {
  final String username;
  final String platform;
  final String status;
  final VoidCallback? onInvestigate;
  final VoidCallback? onTakeDown;

  const FakeAccountCard({
    super.key,
    required this.username,
    required this.platform,
    required this.status,
    this.onInvestigate,
    this.onTakeDown,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(Icons.account_circle, size: 40), // Placeholder image
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username: $username',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Platform: $platform'),
                  Text('Status: $status'),
                ],
              ),
            ),
            Column(
              children: [
                if (onInvestigate != null)
                  ElevatedButton(
                    onPressed: onInvestigate,
                    child: Text('Investigate'),
                  ),
                if (onTakeDown != null)
                  ElevatedButton(
                    onPressed: onTakeDown,
                    child: Text('Take Down'),
                  ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Report action
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Report'),
                          content: Text('Reporting $username...'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Report'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
