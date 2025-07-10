import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrolling_olx_live/case1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 4, vsync: this);
  var showPerformanceOverlay = false;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.transparent,
        dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildThemeData(),
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(showPerformanceOverlay ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      showPerformanceOverlay = !showPerformanceOverlay;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
                Expanded(
                  child: TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Case 1'),
                      Tab(text: 'Case 2'),
                      Tab(text: 'Case 3'),
                      Tab(text: 'Case 4'),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Case1(),
                  Center(child: Text('Content for Case 2')),
                  Center(child: Text('Content for Case 3')),
                  Center(child: Text('Content for Case 4')),
                ],
              ),
            ),
            if (showPerformanceOverlay) PerformanceOverlay.allEnabled(),
          ],
        ),
      ),
    );
  }
}
