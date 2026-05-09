import 'dart:convert';

import 'package:get/get.dart';
import 'package:student_project1/features/auth/data/models/forgetpassword_model.dart';
import '../../domain/entities/firestregister_user.dart';
import '../../domain/entities/register_user.dart';
import '../models/firstregisteruser_model.dart';
import '../models/registeruser_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String phone, String password);
  Future<RegisteruserModel> register(
      String name,
      String phone,
      String location,
      String subject,
      String password,
      String confirmpassword,
      );
  Future<FirstRegisteruserModel> firstregister(
   String role,
   String persone_image,
   String identity_image,

      );
  Future<ForgetPasswordModel> forgetpassword(
   String email,
   String ip,
   String new_password,
   String confirmed_password,

      );
}


class AuthRemoteDataSourceImpl extends GetConnect implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String phone, String password) async {
    final response = await post('http://your-laravel-api.com/api/login', {
      'phone': phone,
      'password': password,
    });

    if (response.status.hasError) {
      throw Exception("Login Failed");
    } else {
      return UserModel.fromJson(response.body['data']);
    }
  }


  Future<RegisteruserModel> register(
      String name,
      String phone,
      String location,
      String subject,
      String password,
      String confirmpassword,
      ) async {
    final response = await post('http://your-laravel-api.com/api/register', {
      'name': name,
      'phone': phone,
      'location': location,
      'subject': subject,
      'password': password,
      'password_confirmation': confirmpassword,
    });

    if (response.status.hasError) {
      throw Exception("Register Failed");
    } else {
      return RegisteruserModel.fromJson(response.body['data']);
    }
  }


  Future<FirstRegisteruserModel> firstregister(
      String role,
      String persone_image,
      String identity_image,
      ) async {
    final response = await post('http://your-laravel-api.com/api/firstregister', {
      'role': role,
      'persone_image': persone_image,
      'identity_image': identity_image,

    });

    if (response.status.hasError) {
      throw Exception("Register Failed");
    } else {
      return FirstRegisteruserModel.fromJson(response.body['data']);
    }
  }

  Future<ForgetPasswordModel> forgetpassword(
      String email,
      String ip,
      String new_password,
      String confirmed_password,
      ) async {
    final response = await post('http://your-laravel-api.com/api/forgetpassword', {
      'email': email,
      'ip': ip,
      'new_password': new_password,
      'confirmed_password': confirmed_password,

    });

    if (response.status.hasError) {
      throw Exception("Register Failed");
    } else {
      return ForgetPasswordModel.fromJson(response.body['data']);
    }
  }
}