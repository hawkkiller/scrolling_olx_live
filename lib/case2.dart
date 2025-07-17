import 'package:flutter/material.dart';

/// ListView (without builder) with large content.
/// Also, talk about [ListView.itemExtent]
class Case2 extends StatefulWidget {
  const Case2({super.key});

  @override
  State<Case2> createState() => _Case2State();
}

class _Case2State extends State<Case2> {
  var items = List.generate(10000, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text('Hello World!'),
        ),
        SliverPadding(padding: EdgeInsets.all(20)),
        SliverFixedExtentList.builder(
          itemCount: items.length,
          itemExtent: 60,
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
        ),
      ],
    );
  }
}
