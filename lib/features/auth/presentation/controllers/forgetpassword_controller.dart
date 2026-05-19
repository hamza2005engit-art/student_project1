import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/features/auth/domain/entities/first_forgetpassword_user.dart';
import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';
import 'package:student_project1/routes/app_routes.dart';
import '../../domain/usecases/first_forgetpassword_usecase.dart';
import '../../domain/usecases/forgetpassword_usecase.dart';

class ForgetPasswordController extends GetxController {
  final ForgetpasswordUsecase forgetpasswordusercase;
  final FirstForgetpasswordUsecase firstForgetpasswordUsecase;

  ForgetPasswordController(this.forgetpasswordusercase, this.firstForgetpasswordUsecase);

  final isLoading = false.obs;

  final emailController = TextEditingController();
  final ipController = TextEditingController();
  final new_passwordController = TextEditingController();
  final confirmed_passwordController = TextEditingController();

  // المرحلة الأولى: إرسال الإيميل للحصول على الـ OTP
  Future<void> sendOtp() async {
    if (emailController.text.isEmpty) {
      Get.snackbar("تنبيه", "يرجى إدخال البريد الإلكتروني");
      return;
    }

    isLoading.value = true;
    try {
      await firstForgetpasswordUsecase.call(FirstForgetpasswordUser(
        id: 0,
        email: emailController.text.trim(),
      ));

      Get.snackbar("نجاح", "تم إرسال رمز التحقق إلى بريدك الإلكتروني");
      
      // الانتقال لشاشة إدخال الكود وتغيير كلمة المرور
      Get.toNamed(Routes.FORGETPASSWORD); 
      
    } catch (e) {
      Get.snackbar("خطأ", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // المرحلة الثانية: تغيير كلمة المرور باستخدام الكود المستلم
  Future<void> forgetpassword() async {
    if (new_passwordController.text != confirmed_passwordController.text) {
      Get.snackbar("خطأ", "كلمات المرور غير متطابقة");
      return;
    }

    isLoading.value = true;
    try {
      await forgetpasswordusercase.call(ForgetpasswordUser(
        email: emailController.text.trim(),
        ip: ipController.text.trim(),
        new_password: new_passwordController.text,
        id: 11, confirmed_password: '',
      ));
      
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar("نجاح", "تم تغيير كلمة المرور بنجاح");
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    ipController.dispose();
    new_passwordController.dispose();
    confirmed_passwordController.dispose();
    super.onClose();
  }
}
