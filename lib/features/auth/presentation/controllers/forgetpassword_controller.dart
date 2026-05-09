

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_project1/features/auth/domain/entities/firestregister_user.dart';
import 'package:student_project1/features/auth/domain/entities/forgetpassword_user.dart';

import '../../domain/usecases/firstregister_usecase.dart';
import '../../domain/usecases/forgetpassword_usecase.dart';

class ForgetPasswordController extends GetxController {
  final ForgetpasswordUsecase forgetpasswordusercase;

  ForgetPasswordController(this.forgetpasswordusercase);

  final isLoading = false.obs;

  final emailController = TextEditingController();
  final ipController = TextEditingController();
  final new_passwordController = TextEditingController();
  final confirmed_passwordController = TextEditingController();



  Future<void> forgetpassword() async {
    isLoading.value = true;
    try {
      await forgetpasswordusercase;
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}