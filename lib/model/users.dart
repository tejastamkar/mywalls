import 'dart:convert';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.age,
  });

  final String id;
  final String name;
  final int age;

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(age: json['age'], name: json['name'], id: json['id']);
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(age: json['age'], name: json['name'], id: json['id']);
  }

  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //       id: json["id"],
  //       name: json["name"],
  //       age: json["email"],
  //     );

  // Map<String, dynamic> toJson() => {"id": id, "name": name, "age": age};
}

List<UserModel> decodeUserModel(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<UserModel>((json) => UserModel.fromMap(json)).toList();
}
