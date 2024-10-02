class User {
  String id;
  String fullname;
  DateTime createDate;
  String password;
  String roleName;

  User({
    required this.id,
    required this.fullname,
    required this.createDate,
    required this.password,
    required this.roleName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullname: json['fullname'],
      createDate: DateTime.parse(json['create_date']),
      password: json['password'],
      roleName: json['role_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'create_date': createDate.toIso8601String(),
      'password': password,
      'role_name': roleName,
    };
  }
}
