import 'package:flutter/material.dart';
import 'homepage.dart';

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

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications', style: TextStyle(color: Colors.black))),
      body: Center(child: Text('No notifications available.')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile', style: TextStyle(color: Colors.black))),
      body: Center(child: Text('User Profile Information')),
    );
  }
}
