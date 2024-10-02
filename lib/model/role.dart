class Role {
  String id;
  String roleName;

  Role({required this.id, required this.roleName});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      roleName: json['role_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role_name': roleName,
    };
  }
}