// ignore_for_file: sort_child_properties_last

import 'package:final_project/controller/category/category_list.dart';
import 'package:flutter/material.dart';

class DashboardAdmin extends StatelessWidget {
  DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[dashBg, content(context)],
      ),
    );
  }

  // Background gradient
  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 77, 139, 255),
                    Colors.purpleAccent
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 5,
          ),
        ],
      );

  // Main content including header and grid
  Widget content(BuildContext context) => Container(
        child: Column(
          children: <Widget>[
            header,
            grid(context),
          ],
        ),
      );

  // Header section
  get header => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: ListTile(
          title: const Text(
            'Admin Dashboard',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '3 items',
            style: TextStyle(
              color: Colors.blue[200],
              fontSize: 16,
            ),
          ),
        ),
      );

  // List of actions for grid items
  final List<String> itemNames = [
    'Category',
    'Size',
    'Product',
  ];

  final List<Widget> itemPages = [
    const CategoryList(), // Form for adding Product (just an example)
  ];

  // Grid layout with items
  Widget grid(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            childAspectRatio: .85,
            children: List.generate(itemNames.length, (index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigate to the respective form when an item is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => itemPages[index],
                      ),
                    );
                  },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
                          Icons.dashboard,
                          size: 40,
                          color: Colors.deepPurpleAccent,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          itemNames[index], // Display the item name
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
}
