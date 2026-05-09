import 'package:student_project1/features/auth/data/datasources/auth_remote_data_source_moke.dart';
import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';

import '../../domain/entities/firestregister_user.dart';
import '../../domain/entities/register_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../domain/entities/user.dart';
import '../models/firstregisteruser_model.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login(String phone, String password) async {
    return await remoteDataSource.login(phone, password);
  }
  @override
  Future<RegisterUser> register(RegisterUser registerUser) async {
    return await remoteDataSource.register(
      registerUser.name,
      registerUser.phone,
      registerUser.location,
      registerUser.subject,
      registerUser.password,
      registerUser.confermpassword,
    );
  }


  @override
  Future<FirstRegisterUser> firstregister
      (FirstRegisterUser firstregisteruser) async{
    return await remoteDataSource.firstregister(
      firstregisteruser.role,
      firstregisteruser.identity_image,
      firstregisteruser.persone_image,
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
}
