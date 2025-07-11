import 'package:flutter/material.dart';

/// - Padding applied to the entire screen.
/// - Sticky headers for each section.
/// - Each section has a title and a list of items.
class Case4 extends StatelessWidget {
  const Case4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: ListView(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder:
                  (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Item ${index + 31}'),
                    ),
                  ),
            ),
          ),
          const Text(
            'Section 1',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...List.generate(10, (index) => ListTile(title: Text('Item ${index + 1}'))),
          const SizedBox(height: 32),
          const Text(
            'Section 2',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...List.generate(10, (index) => ListTile(title: Text('Item ${index + 11}'))),
          const SizedBox(height: 32),
          const Text(
            'Section 3',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...List.generate(10, (index) => ListTile(title: Text('Item ${index + 21}'))),
        ],
      ),
    );
  }
}
