import 'package:flutter/material.dart';

/// SingleChildScrollView with large content
/// 
/// Replace with: [ListView.builder] or [CustomScrollView].
class Case1 extends StatelessWidget {
  const Case1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Hello World!'),
          SizedBox(height: 20),
          for (int i = 0; i < 5000; i++)
            ListTile(
              title: Text('Item $i'),
              subtitle: Text('Subtitle for item $i'),
            ),
        ],
      ),
    );
  }
}
