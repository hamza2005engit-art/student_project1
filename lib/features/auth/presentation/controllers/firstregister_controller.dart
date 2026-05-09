

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_project1/features/auth/domain/entities/firestregister_user.dart';

import '../../../../routes/app_routes.dart';
import '../../domain/usecases/firstregister_usecase.dart';

class FirstRegisterController extends GetxController {
  final FirstRegisterUserCase firstregisteruserCase;

  FirstRegisterController(this.firstregisteruserCase);

  final isLoading = false.obs;
final selectedRole=''.obs;
  final roleController = TextEditingController();
  final persone_imageController = TextEditingController();
  final identity_imageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final personImage = Rxn<XFile>();
  final identityImage = Rxn<XFile>();

  Future<void> firstregister() async {
    isLoading.value = true;
    try {
      await firstregisteruserCase(FirstRegisterUser (
        id:0,
        role: selectedRole.value,
        persone_image: personImage.value?.path??'',
        identity_image:identityImage.value?.path??'',

      ));
      Get.offAllNamed(Routes.REGISTER1);
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  // أضف بارامتر بولين (boolean) لتحديد نوع الصورة
  Future<void> pickImage(bool isPersonImage) async {
    await Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text("Camera"),
              onTap: () async {
                Get.back();
                final image = await _picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  // هنا نتحقق أي صورة سنقوم بتحديثها
                  if (isPersonImage) {
                    personImage.value = image;
                  } else {
                    identityImage.value = image;
                  }
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text("Gallery"),
              onTap: () async {
                Get.back();
                final image = await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  // نفس التحقق هنا أيضاً
                  if (isPersonImage) {
                    personImage.value = image;
                  } else {
                    identityImage.value = image;
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}