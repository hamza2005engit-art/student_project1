

import '../entities/first_forgetpassword_user.dart';
import '../entities/forgetpassword_user.dart';
import '../repositories/auth_repository.dart';

class FirstForgetpasswordUsecase {
  final AuthRepository repository;

  FirstForgetpasswordUsecase(this.repository);

  Future<FirstForgetpasswordUser> call(FirstForgetpasswordUser firstforgetpassworduser) {
    return  repository.firstforgetpassword(firstforgetpassworduser);
  }
}