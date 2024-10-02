// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/controller/category/add_category.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // Dữ liệu mẫu cho bảng category
  List<Map<String, String>> categories = [
    {'id': '1', 'category_name': 'Electronics'},
    {'id': '2', 'category_name': 'Clothing'},
    {'id': '3', 'category_name': 'Books'},
  ];
  void _addCategory()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCategory())
    );
  }
  

  // Hàm sửa category (ví dụ cơ bản)
  void _editCategory(int index) {
    setState(() {
      categories[index]['category_name'] = 'Edited Category';
    });
  }

  // Hàm xóa category
 void _deleteCategory(int index) async {
  String categoryId = categories[index]['id']!;
  
  // Xóa danh mục khỏi Firestore
  await FirebaseFirestore.instance.collection('categories').doc(categoryId).delete();

  // Cập nhật lại danh sách danh mục
  setState(() {
    categories.removeAt(index);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Category List')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Category List',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('Category Name'),
                    ),
                    DataColumn(
                      label: Text('Actions'),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    categories.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          Text(categories[index]['category_name']!),
                        ),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.blue,
                                onPressed: () {
                                  _editCategory(index);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  _deleteCategory(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: _addCategory,
                icon: Icon(Icons.add),
                label: Text('Add Category'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CategoryList(),
  ));
}
