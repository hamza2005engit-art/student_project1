import 'package:student_project1/features/auth/domain/entities/register_user.dart';

class RegisteruserModel extends RegisterUser {
  RegisteruserModel({required super.id,
    required super.name,
    required super.phone,
    required super.location,
    required super.subject,
    required super.password,
    required super.confermpassword,
    super.token});

  factory RegisteruserModel.fromJson(Map<String, dynamic> json) {
    return RegisteruserModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      location: json['location'],
      subject: json['subject'],
      password: json['password'],
      confermpassword: json['confermpassword'],
      token: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'location': location,
      'subject': subject,
      'password': password,
      'password_confirmation': confermpassword,
    };
  }

}