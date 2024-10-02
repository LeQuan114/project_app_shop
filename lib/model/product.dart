class Product {
  String id;
  String productName;
  String description;
  String image;
  double price;
  String categoryId;

  Product({
    required this.id,
    required this.productName,
    required this.description,
    required this.image,
    required this.price,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productName: json['product_name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      categoryId: json['category_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': productName,
      'description': description,
      'image': image,
      'price': price,
      'category_id': categoryId,
    };
  }
}
