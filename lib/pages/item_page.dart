// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
             color: Color(0xFF4C53A5)),
          onPressed: () {
            Navigator.pop(context);
            // Back button action
          },
        ),
        title: Text(
          "Product",
          style: TextStyle(color: Color(0xFF4C53A5)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.red),
            onPressed: () {
              // Favorite button action
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Product Image
          Center(
            child: Image.asset(
              "images/1.png",
              height: 300,
            ),
          ),
          SizedBox(height: 20),

          // Product Title and Rating
          Text(
            "Product Title",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < 4 ? Icons.star : Icons.star_border,
                color: const Color.fromARGB(255, 255, 173, 59),
              );
            }),
          ),

          // Product Description
          SizedBox(height: 16),
          Text(
            "This is a more detailed description of the product. You can write here more about the product. This is a lengthy description.",
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),

          // Quantity Selector
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quantity",
                style: TextStyle(fontSize: 18,
                 fontWeight: FontWeight.bold,
                 color: Color(0xFF4C53A5),
                 ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    color: Color(0xFF4C53A5),
                    onPressed: () {
                      // Decrease quantity
                    },
                  ),
                  Text(
                    "01",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF4C53A5),
                    ),
                    
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Color(0xFF4C53A5),
                    onPressed: () {
                      // Increase quantity
                    },
                  ),
                ],
              )
            ],
          ),

          // Size Selector
          SizedBox(height: 16),
          Text(
            "Size:",
            style: TextStyle(
              fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Color(0xFF4C53A5),
               ),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 10,
            children: List.generate(7, (index) {
              return ChoiceChip(
                label: Text("${5 + index}"),
                selected: false, // Replace with a logic to select size
              );
            }),
          ),

          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$55",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
              ElevatedButton.icon(
               onPressed: (){},
               icon: Icon(
                CupertinoIcons.cart_badge_plus,
                ), 
               label: Text(
                "Add to cart",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
               ),
              ),
            ],
          ),

          
          
        ],
      ),

    );
  }
}

