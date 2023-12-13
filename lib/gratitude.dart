import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  static const routeName = '/gratitude';

  const Gratitude();

  @override
  _GratitudeState createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  String _selectedValue = '';

  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedValue = value ?? '';
    });
  }

  void _handleSaveButton() {
    Navigator.pop(context, _selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gratitude'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select your gratitude:',
              style: TextStyle(fontSize: 20),
            ),
            RadioListTile<String>(
              title: const Text('Option 1'),
              value: 'Option 1',
              groupValue: _selectedValue,
              onChanged: _handleRadioValueChange,
            ),
            RadioListTile<String>(
              title: const Text('Option 2'),
              value: 'Option 2',
              groupValue: _selectedValue,
              onChanged: _handleRadioValueChange,
            ),
            RadioListTile<String>(
              title: const Text('Option 3'),
              value: 'Option 3',
              groupValue: _selectedValue,
              onChanged: _handleRadioValueChange,
            ),
            ElevatedButton(
              onPressed: _handleSaveButton,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}