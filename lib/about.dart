import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle button press
          },
          child: const Text('Button'),
        ),
      ),
    );
  }
}