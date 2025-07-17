import 'package:flutter/material.dart';

/// ListView (without builder) with large content.
///
/// Replace with [ListView.builder], talk about [ListView.itemExtent];
/// Use [CustomScrollView] for implementing the same layout.
class Case2 extends StatefulWidget {
  const Case2({super.key});

  @override
  State<Case2> createState() => _Case2State();
}

class _Case2State extends State<Case2> {
  var items = List.generate(10000, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Hello World!'),
        SizedBox(height: 20),
        for (final item in items)
          ListTile(
            key: ValueKey(item),
            title: Text(item),
            subtitle: Text('Subtitle for $item'),
            leading: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  items.remove(item);
                });
              },
            ),
          ),
      ],
    );
  }
}
