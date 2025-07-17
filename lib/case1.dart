import 'package:flutter/material.dart';

/// SingleChildScrollView with large content
class Case1 extends StatelessWidget {
  const Case1({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text('Hello World!'),
        ),
        SliverPadding(padding: EdgeInsets.all(20)),
        SliverList.builder(
          itemCount: 5000,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
              subtitle: Text('Subtitle for item $index'),
            );
          },
        ),
      ],
    );
  }
}
