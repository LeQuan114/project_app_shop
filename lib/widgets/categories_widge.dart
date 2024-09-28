// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CategoriesWidge extends StatefulWidget {
  const CategoriesWidge({super.key});

  @override
  _CategoriesWidgeState createState() => _CategoriesWidgeState();
}

class _CategoriesWidgeState extends State<CategoriesWidge> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
         for(int i = 1; i < 8; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/$i.png",
                  width: 40,
                  height: 40,
                ),
                const Text(
                  "Sandal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xFF4C53A5),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
