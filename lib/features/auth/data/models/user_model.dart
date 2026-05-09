import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.name, required super.phone, super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      token: json['access_token'],
    );
  }
}