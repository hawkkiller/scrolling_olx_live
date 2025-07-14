import 'package:flutter/material.dart';

/// ListView (without builder) with large content.
/// Also, talk about [ListView.itemExtent] property.
class Case2 extends StatefulWidget {
  const Case2({super.key});

  @override
  State<Case2> createState() => _Case2State();
}

class _Case2State extends State<Case2> {
  var items = List.generate(100000, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 60,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
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
        );
      },
    );
  }
}
