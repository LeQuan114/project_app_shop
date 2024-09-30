// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:final_project/pages/home_page.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddCategoryScreen(),
    );
  }
}

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Biểu tượng quay lại
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Thay đổi thành trang homepage của bạn
              (Route<dynamic> route) => false, // Loại bỏ tất cả các trang trước đó
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add New Category',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Category Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to add category
                  },
                  child: Text('Add Category'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


