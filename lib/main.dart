import 'package:flutter/material.dart';
import 'package:nav_app/about.dart';
import 'package:nav_app/gratitude.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // Set the background color of the navigation bar
        ),
      ),
      home: const Home(),
      routes: {
        Gratitude.routeName: (_) => const Gratitude(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _gratitudeValue = '';

  void _openPageAbout({BuildContext? context, bool fullscreenDialog = false}) {
    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (_) => AboutPage(),
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  Future<void> _openPageGratitude({BuildContext? context}) async {
    final result = await Navigator.pushNamed(
      context!,
      Gratitude.routeName,
      arguments: _gratitudeValue,
    );

    if (result != null) {
      setState(() {
        _gratitudeValue = result as String;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _openPageAbout(
              context: context,
              fullscreenDialog: true,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Grateful for: $_gratitudeValue',
            style: const TextStyle(fontSize: 32.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'Gratitude',
        child: const Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}