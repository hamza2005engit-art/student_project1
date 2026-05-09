import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../domain/entities/register_user.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterController extends GetxController {
  final RegisterUseCase registerUseCase;

  RegisterController(this.registerUseCase);

  final isLoading = false.obs;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final subjectController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register() async {
    isLoading.value = true;
    try {
      await registerUseCase(RegisterUser(
        id:0,
        name: nameController.text,
        phone: phoneController.text,
        location: locationController.text,
        subject: subjectController.text,
        password: passwordController.text,
        confermpassword: confirmPasswordController.text,
      ));
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}