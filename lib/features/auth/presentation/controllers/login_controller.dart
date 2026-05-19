import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  // 1. تعريف المتحكمات هنا لضمان سهولة الوصول إليها والتحكم في الرسائل
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  // 2. تعديل الدالة لعدم استقبال بارامترات (ستسحبها من المتحكمات مباشرة)
  Future<void> login() async {
    // التحقق من الحقول قبل البدء
    if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "تنبيه",
        "يرجى إدخال البريد الإلكتروني وكلمة المرور",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    try {
      // 3. استدعاء الـ UseCase
      await loginUseCase.call(
        emailController.text.trim(),
        passwordController.text,
      );

      // 4. رسالة النجاح (تظهر فقط إذا اكتمل السطر السابق بدون أخطاء)
      Get.snackbar(
        "نجاح",
        "تم تسجيل الدخول بنجاح",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      // 5. الانتقال للصفحة التالية بعد نجاح العملية
      // ملاحظة: قمت بترك المسار كما هو في كودك (Routes.FirstFORGETPASSWORD)
      // ولكن عادة يتم الانتقال للرئيسية HOME
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offAllNamed(Routes.FEES);
      });

    } catch (e) {
      // 6. معالجة الخطأ الحقيقي فقط
      String errorMessage = e.toString().replaceAll('Exception:', '').trim();

      Get.snackbar(
        "خطأ في الدخول",
        errorMessage.contains("401")
            ? "البريد الإلكتروني أو كلمة المرور غير صحيحة"
            : "حدث خطأ أثناء الاتصال بالخادم",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      // ignore: avoid_print
      print("The actual error is: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // تنظيف الذاكرة
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}