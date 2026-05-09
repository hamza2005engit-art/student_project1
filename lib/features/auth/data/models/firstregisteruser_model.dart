import 'package:student_project1/features/auth/domain/entities/register_user.dart';

import '../../domain/entities/firestregister_user.dart';

class FirstRegisteruserModel extends FirstRegisterUser {
  FirstRegisteruserModel({required super.id,
    required super.role,
    required super.persone_image,
    required super.identity_image,

    super.token
  });

  factory FirstRegisteruserModel.fromJson(Map<String, dynamic> json) {
    return FirstRegisteruserModel(
      id: json['id'],
      role: json['role'],
      persone_image: json['persone_image'],
      identity_image: json['identity_image'],

      token: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'persone_image': persone_image,
      'identity_image': identity_image,

    };
  }

}