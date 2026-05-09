import 'package:get/get.dart';
import 'package:student_project1/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:student_project1/features/auth/data/datasources/auth_remote_data_source_moke.dart';
import 'package:student_project1/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';
import 'package:student_project1/features/auth/domain/repositories/auth_repository.dart';
import 'package:student_project1/features/auth/domain/usecases/forgetpassword_usecase.dart';
import 'package:student_project1/features/auth/domain/usecases/login_usecase.dart';
import 'package:student_project1/features/auth/presentation/controllers/login_controller.dart';

import '../../domain/usecases/firstregister_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../controllers/firstregister_controller.dart';
import '../controllers/forgetpassword_controller.dart';
import '../controllers/register_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {

    //Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
    // للبيانات الوهمية أثناء التطوير
    Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSourceMock());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: Get.find()));


    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => LoginController(loginUseCase: Get.find()));
    Get.lazyPut(() => RegisterUseCase(Get.find()));
    Get.lazyPut(() => RegisterController(Get.find()));
    Get.lazyPut(() => FirstRegisterUserCase(Get.find()));
    Get.lazyPut(() => FirstRegisterController(Get.find()));
    Get.lazyPut(() => ForgetpasswordUsecase(Get.find()));
    Get.lazyPut(() => ForgetPasswordController(Get.find()));
  }
}
