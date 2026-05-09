import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';

import '../entities/firestregister_user.dart';
import '../entities/register_user.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String phone, String password);
  Future<RegisterUser> register( RegisterUser registeruser);
  Future<FirstRegisterUser> firstregister( FirstRegisterUser firstregisteruser);
  Future<ForgetpasswordUser> forgetpassword( ForgetpasswordUser forgetpassworduser);
}