import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedPlatform = 'Select Platform';
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
                  const SizedBox(width: 10),
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
                        const DropdownMenuItem(
                          value: 'Select Platform',
                          child: Text('Select Platform'),
                        ),
                        DropdownMenuItem(
                          value: 'Instagram',
                          child: Row(
                            children: [
                              Image.asset('assets/instagram.png', height: 24, width: 24),
                              const SizedBox(width: 10),
                              const Text('Instagram'),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Facebook',
                          child: Row(
                            children: [
                              Image.asset('assets/facebook.png', height: 24, width: 24),
                              const SizedBox(width: 10),
                              const Text('Facebook'),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Twitter',
                          child: Row(
                            children: [
                              Image.asset('assets/twitter.png', height: 24, width: 24),
                              const SizedBox(width: 10),
                              const Text('Twitter'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(labelText: 'Enter Account URL'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showDetails = !_showDetails;
                  });
                },
                child: const Text('Fetch Account Details'),
              ),
              const SizedBox(height: 20),
              if (_showDetails)
                Column(
                  children: [
                    Text(
                      'Account Details Fetched!\nPlatform: $_selectedPlatform\nURL provided: <Enter URL>',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showDetails = false;
                        });
                      },
                      child: const Text('Start Detection Test'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}