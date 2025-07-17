import 'package:flutter/material.dart';

/// SingleChildScrollView with large content
///
/// Replace with: [ListView.builder] or [CustomScrollView].
class Case1 extends StatelessWidget {
  const Case1({super.key});

  // Text('Hello World!'),
  // SizedBox(height: 20),
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text('Hello World!'),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverList.builder(
          itemCount: 1000,
          itemBuilder: (context, index) {
            final item = 'Item $index';
            return ListTile(
              key: ValueKey(item),
              title: Text(item),
              subtitle: Text('Subtitle for $item'),
              leading: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Handle item removal
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
