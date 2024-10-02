class Size {
  String id;
  String sizeName;

  Size({required this.id, required this.sizeName});

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      id: json['id'],
      sizeName: json['size_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'size_name': sizeName,
    };
  }
}
