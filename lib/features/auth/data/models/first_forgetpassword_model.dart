

import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';

import '../../domain/entities/first_forgetpassword_user.dart';

class FirstForgetPasswordModel extends FirstForgetpasswordUser {
  FirstForgetPasswordModel({required super.id,
    required super.email,

    super.token
  });

  factory FirstForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return FirstForgetPasswordModel(
      id: json['id'],
      email: json['email'],


      token: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,

    };
  }

}