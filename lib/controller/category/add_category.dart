// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/pages/home_page.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatelessWidget {
  // Tham số nhận tên danh mục
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
  final TextEditingController _categoryController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; //
  final String id; // Biến final chưa được khởi tạo
  final String name; // Biến final chưa được khởi tạo

  _AddCategoryScreenState()
      : id = '',
        name = ''; // Khởi tạo biến ở đây Khởi tạo Firestore

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false,
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
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Category Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed:
                      _addCategoryToFirebase, // Gọi hàm thêm danh mục vào Firestore
                  child: Text('Add Category'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addCategoryToFirebase() async {
    String categoryName = _categoryController.text.trim();
    if (categoryName.isNotEmpty) {
      String categoryId = _firestore.collection('categories').doc().id;

      // Thêm danh mục vào Firestore
      await _firestore.collection('categories').doc(categoryId).set({
        'id': categoryId,
        'name': categoryName,
      });

      // Kiểm tra xem widget có còn được mount không trước khi sử dụng BuildContext
      if (mounted) {
        _categoryController.clear(); // Clear TextField
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Category added successfully')),
        );

        // Điều hướng về HomePage sau khi thêm thành công
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false,
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a category name')),
        );
      }
    }
  }
}
