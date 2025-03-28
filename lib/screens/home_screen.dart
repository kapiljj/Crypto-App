import 'package:flutter/material.dart';
import 'crypto_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final String token;

  const HomeScreen({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Placeholder for search functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search pressed')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Placeholder for notifications functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications pressed')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Placeholder for profile or settings
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile pressed')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Crypto Tracker!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Your token is securely stored.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to CryptoListScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CryptoListScreen(token: "eyJhbGciOiJIUzI1NilsInRScCI6IkpXVCJ9.eyJpZCl6lmQxYzFIYZUWLTU3NzQtNDIOMSO40TViLWYOMjBiZjRINDQ5ZClsInJvbGUiOmS1bGwsImFwcF9hY2NIc3MiOmZhbHNILCJhZG1pbI9hY2Nic3MiOmZhbHNILCJpYXQiOjESNDMwMTMZzOTIsImV4cCl6MTcOMzASOTcSMiwiaXNzljoiZGlyZWNOdXMifQ.2KrGkIkVA2R6rrdWKNfJscESocM_d2QsU8mOXWYJvZE"),
                  ),
                );
              },
              child: const Text('View Crypto List'),
            ),
          ],
        ),
      ),
    );
  }
}
