import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:student_project1/core/widget/custom_link.dart';
import 'package:student_project1/features/auth/presentation/widgets/corner_circle.dart';
import 'package:student_project1/core/widget/custom_buttom.dart';
import 'package:student_project1/core/widget/custom_text_field.dart';
import 'package:student_project1/features/auth/presentation/widgets/login_footer.dart';
import 'package:student_project1/features/auth/presentation/widgets/auth_header.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تعريف المتحكم يدوياً إذا لم يتعرف عليه GetView تلقائياً
    final LoginController controller = Get.find<LoginController>();
    // تعريف Controllers لحقول الإدخال للحصول على النصوص منها
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      // هذا السطر يمنع العناصر من القفز للأعلى عند ظهور لوحة المفاتيح
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const CornerCircles(),
          SafeArea(
            minimum: const EdgeInsets.all(12),
            child: Center(
              // Center لضمان توسيط العناصر في الشاشات الكبيرة
              child: SingleChildScrollView(
                // إضافة BouncingScrollPhysics تعطي شعوراً أفضل عند التمرير
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     AuthHeader(
                      title: ("Login".tr),
                      subtitle: "login_subtitle".tr,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: phoneController,
                      label: ("Phone Number".tr),
                      hintText: "09** *** ***".tr,
                      prefixIcon: Icons.phone_outlined,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: passwordController,
                      label: "Password".tr,
                      hintText: "Enter password".tr,
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      validationTag: "logIn",
                    ),
                    const SizedBox(height: 16),
                     Align(
                      alignment: Alignment.centerRight,
                      child: CustomLink(text: "forget_password?".tr),
                    ),
                    const SizedBox(height: 32),
                    // استخدام Obx لمراقبة حالة التحميل وتغيير شكل الزر
                    Obx(
                      () => controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              text: "Login".tr,
                              icon: Icons.login,
                              onPressed: () {
                                // استدعاء دالة تسجيل الدخول من المتحكم
                                controller.login(
                                  phoneController.text.trim(),
                                  passwordController.text.trim(),
                                );
                              },
                            ),
                    ),
                    const SizedBox(height: 40),
                    const LoginFooter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
