

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../domain/usecases/notification_usecase.dart';

class NotfincationController extends GetxController {
  final NotifincationUsecase notifincationusercase;

  NotfincationController(this.notifincationusercase);

  final isLoading = false.obs;

  final titleController = TextEditingController();
  final conectController = TextEditingController();
  final dateController = TextEditingController();




  Future<void> notifincation() async {
    isLoading.value = true;
    try {
      await notifincationusercase;
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}