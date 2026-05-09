
import '../entities/firestregister_user.dart';
import '../repositories/auth_repository.dart';

class FirstRegisterUserCase {
  final AuthRepository repository;

  FirstRegisterUserCase(this.repository);

  Future<FirstRegisterUser> call(FirstRegisterUser firstregisteruser) {
    return  repository.firstregister(firstregisteruser);
  }
}