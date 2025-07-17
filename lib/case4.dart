import 'package:flutter/material.dart';

/// - Padding applied to the entire screen.
/// - Sticky headers for each section.
/// - Each section has a title and a list of items.
class Case4 extends StatelessWidget {
  const Case4({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        for (final section in sections)
          SliverMainAxisGroup(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                primary: false,
                title: Text(section.title),
              ),
              SliverList.builder(
                itemBuilder: (context, index) {
                  final item = section.items[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.description),
                  );
                },
                itemCount: section.items.length,
              ),
            ],
          ),
      ],
    );
  }
}

final sections = List<Section>.generate(
  10,
  (index) => Section(
    title: 'Section $index',
    items: List<SectionItem>.generate(
      10,
      (index) => SectionItem(
        title: 'Item $index',
        description: 'Description $index',
      ),
    ),
  ),
);

class Section {
  const Section({required this.title, required this.items});

  final String title;
  final List<SectionItem> items;
}

class SectionItem {
  const SectionItem({required this.title, required this.description});

  final String title;
  final String description;
}
