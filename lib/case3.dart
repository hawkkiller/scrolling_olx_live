import 'package:flutter/material.dart';

/// ListView with horizontal scroll and a vertical list
class Case3 extends StatefulWidget {
  const Case3({super.key});

  @override
  State<Case3> createState() => _Case3State();
}

class _Case3State extends State<Case3> {
  var items = List.generate(500, (index) => 'Item $index');

  void _onItemRemoved(String item) {
    setState(() {
      items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppBar(
          title: Text('Case 3'),
          backgroundColor: Colors.blue,
        ),
        Text('Hello World!'),
        SizedBox(height: 20),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 100,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, i) {
            final item = items[i];
            return ListTile(
              key: ValueKey(item),
              title: Text(item),
              subtitle: Text('Subtitle for $item'),
              leading: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _onItemRemoved(item),
              ),
              trailing: Icon(Icons.arrow_forward),
            );
          },
        ),
      ],
    );
  }
}
