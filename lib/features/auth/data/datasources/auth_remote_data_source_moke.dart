import 'package:student_project1/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:student_project1/features/auth/data/models/forgetpassword_model.dart';
import 'package:student_project1/features/auth/data/models/user_model.dart';

import '../models/firstregisteruser_model.dart';
import '../models/registeruser_model.dart';

class AuthRemoteDataSourceMock implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String phone, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    UserModel user = UserModel(
      id: 99,
      name: "Hamza AlRefai",
      phone: phone,
      token: "hahahahah72727hah",
    );
    return user;
  }
  @override
  Future<RegisteruserModel> register(
      String name,
      String phone,
      String location,
      String subject,
      String password,
      String confermpassword,
      ) async {
    await Future.delayed(const Duration(seconds: 1));
    return RegisteruserModel(
      id: 99,
      name: name,
      phone: phone,
      location: location,
      subject: subject,
      password: password,
      confermpassword: confermpassword,
      token: "mock_token",
    );
  }

  Future<FirstRegisteruserModel> firstregister(
      String role,
      String persone_image,
      String identity_image,
      ) async {
    await Future.delayed(const Duration(seconds: 1));
    return FirstRegisteruserModel(
      id: 99,
      role: role,
      persone_image: persone_image,
      identity_image: identity_image,
      token: "mock_token",
    );
  }


  Future<ForgetPasswordModel> forgetpassword(
      String email,
      String ip,
      String new_password,
      String confirmed_password,
      ) async {
    await Future.delayed(const Duration(seconds: 1));
    return ForgetPasswordModel(
      id: 99,
      email: email,
      ip: ip,
      new_password: new_password,
      confirmed_password: confirmed_password,
      token: "mock_token",
    );
  }
}
