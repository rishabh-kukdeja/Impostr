import 'package:flutter/material.dart';

void main() {
  runApp(FakeAccountDetectorApp());
}

class FakeAccountDetectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Account Detector',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[200],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.grey[800], fontSize: 18),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelStyle: TextStyle(color: Colors.grey[700]),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[200],
            foregroundColor: Colors.black,
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Home Page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedPlatform = 'Select Platform';
  bool _showDetails = false; // Toggle visibility for details

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fake Account Detector',
          style: TextStyle(color: Colors.black),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png', height: 40),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Platform:', style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton<String>(
                      value: _selectedPlatform,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPlatform = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'Select Platform',
                          child: Text('Select Platform'),
                        ),
                        DropdownMenuItem(
                          value: 'Instagram',
                          child: Row(
                            children: [
                              Image.asset('assets/instagram.png', height: 24, width: 24),
                              SizedBox(width: 10),
                              Text('Instagram'),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Facebook',
                          child: Row(
                            children: [
                              Image.asset('assets/facebook.png', height: 24, width: 24),
                              SizedBox(width: 10),
                              Text('Facebook'),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Twitter',
                          child: Row(
                            children: [
                              Image.asset('assets/twitter.png', height: 24, width: 24),
                              SizedBox(width: 10),
                              Text('Twitter'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Enter Account URL'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showDetails = !_showDetails;
                  });
                },
                child: Text('Fetch Account Details'),
              ),
              SizedBox(height: 20),
              if (_showDetails) ...[
                Text(
                  'Account Details Fetched!\nPlatform: $_selectedPlatform\nURL provided: <Enter URL>',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showDetails = false;
                    });
                    // Perform detection test
                  },
                  child: Text('Start Detection Test'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Notifications Page
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications', style: TextStyle(color: Colors.black))),
      body: Center(child: Text('No notifications available.')),
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile', style: TextStyle(color: Colors.black))),
      body: Center(child: Text('User Profile Information')),
    );
  }
}
