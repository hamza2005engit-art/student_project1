

import '../entities/forgetpassword_user.dart';
import '../repositories/auth_repository.dart';

class ForgetpasswordUsecase {
  final AuthRepository repository;

  ForgetpasswordUsecase(this.repository);

  Future<ForgetpasswordUser> call(ForgetpasswordUser forgetpassworduser) {
    return  repository.forgetpassword(forgetpassworduser);
  }
}