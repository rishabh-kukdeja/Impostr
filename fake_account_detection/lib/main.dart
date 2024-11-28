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
          bodyMedium: TextStyle(color: Colors.grey[700]),
          bodySmall: TextStyle(color: Colors.grey[600]),
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _urlController = TextEditingController();
  String _selectedPlatform = 'Select Platform';
  String _accountDetails = '';
  String _detectionResult = '';

  Future<void> _fetchAccountDetails() async {
    setState(() {
      _accountDetails = 'Account details fetched for: ${_urlController.text}';
    });
  }

  Future<void> _startDetection() async {
    setState(() {
      _detectionResult = 'This account is likely ${_simulateDetection()}';
    });
  }

  String _simulateDetection() {
    return _urlController.text.contains('fake') ? 'FAKE' : 'REAL';
  }

  void _selectPlatform(String platform) {
    setState(() {
      _selectedPlatform = platform;
    });
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Action when profile icon is tapped
            },
          ),
        ],
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Platform:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _selectPlatform('Instagram'),
                  child: Image.asset(
                    'assets/instagram.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectPlatform('Facebook'),
                  child: Image.asset(
                    'assets/facebook.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectPlatform('Twitter'),
                  child: Image.asset(
                    'assets/twitter.png',
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Selected Platform: $_selectedPlatform',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter Account URL',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchAccountDetails,
              child: Text('Fetch Account Details'),
            ),
            SizedBox(height: 20),
            Text(
              _accountDetails,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startDetection,
              child: Text('Start Detection Test'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[300],
              ),
            ),
            SizedBox(height: 20),
            Text(
              _detectionResult,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
