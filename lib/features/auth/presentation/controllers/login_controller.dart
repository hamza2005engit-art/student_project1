import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/features/auth/domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  var isLoading = false.obs;

  Future<void> login(String phone, String password) async {
    isLoading.value = true;
    try {
      await loginUseCase.call(phone, password);
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
          "Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
      );
      // ignore: avoid_print
      print("The actual error is: $e"); // سيظهر لك التفاصيل في الـ Console
    } finally {
      isLoading.value = false;
    }
  }
}
