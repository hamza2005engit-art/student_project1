

import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';

class ForgetPasswordModel extends ForgetpasswordUser {
  ForgetPasswordModel({required super.id,
    required super.email,
    required super.ip,
    required super.new_password,
    required super.confirmed_password,
    super.token
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      id: json['id'],
      email: json['email'],
      ip: json['ip'],
      new_password: json['new_password'],
      confirmed_password: json['confirmed_password'],

      token: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'ip': ip,
      'new_password': new_password,
      'confirmed_password': confirmed_password,
    };
  }

}