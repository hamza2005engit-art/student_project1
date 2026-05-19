import 'package:student_project1/features/auth/data/datasources/auth_remote_data_source_moke.dart';
import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';


import '../../domain/entities/first_forgetpassword_user.dart';
import '../../domain/entities/register_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../domain/entities/user.dart';



class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login(String email, String password) async {
    return await remoteDataSource.login(email, password);
  }



  @override
  Future<RegisterUser> register(RegisterUser registerUser) async {
    return await remoteDataSource.register(
      registerUser
      // registerUser.name,
      // registerUser.phone,
      // registerUser.location,
      // registerUser.subject,
      // registerUser.password,
      // registerUser.confermpassword
    );
  }










  @override
  Future<ForgetpasswordUser> forgetpassword
      (ForgetpasswordUser forgetpassworduser) async{
    return await remoteDataSource.forgetpassword(
      forgetpassworduser.email,
      forgetpassworduser.ip,
      forgetpassworduser.new_password,
      forgetpassworduser.confirmed_password,
    );

  }

  @override
  Future<FirstForgetpasswordUser> firstforgetpassword(FirstForgetpasswordUser firstforgetpassworduser)async {
    return await remoteDataSource.firstforgetpassword(
        firstforgetpassworduser.email as FirstForgetpasswordUser

    );
  }
}
