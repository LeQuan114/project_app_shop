class Invoice {
  String id;
  String address;
  DateTime createDate;
  String note;
  String phone;
  double total;
  String userFullname;

  Invoice({
    required this.id,
    required this.address,
    required this.createDate,
    required this.note,
    required this.phone,
    required this.total,
    required this.userFullname,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      address: json['address'],
      createDate: DateTime.parse(json['create_date']),
      note: json['note'],
      phone: json['phone'],
      total: json['total'],
      userFullname: json['user_fullname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'create_date': createDate.toIso8601String(),
      'note': note,
      'phone': phone,
      'total': total,
      'user_fullname': userFullname,
    };
  }
}
