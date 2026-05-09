import 'dart:ui' as BorderType;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widget/costum_image_continer.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../../../../core/widget/custom_role_card.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/firstregister_controller.dart';
import '../controllers/register_controller.dart';
import 'package:student_project1/features/auth/presentation/widgets/corner_circle.dart';
import 'package:student_project1/features/auth/presentation/widgets/auth_header.dart';

class FirstRegisterScreen extends StatelessWidget {
  const FirstRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirstRegisterController controller = Get.find<FirstRegisterController>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const CornerCircles(),
          SafeArea(
            minimum: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                   AuthHeader(
                    title: "creat acount".tr,
                    subtitle: "creat acount subtitlr".tr,
                  ),
                  const SizedBox(height: 24,),
                  Align(
                    alignment: Get.locale?.languageCode=="ar"
                    ?Alignment.centerRight
                    :Alignment.centerLeft,
                    child: Text(
                      'Choose role'.tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ),
                  const SizedBox(height: 14,),
                  Obx(()=>    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoleCard(
                              title: 'Student'.tr,
                              isSelected: controller.selectedRole.value=="student",

                              onTap: () =>controller.selectedRole.value="student",
                            height:100 ,
                              width: 100,
                            ),
                            RoleCard(
                              title: 'Teacher'.tr,
                              isSelected: controller.selectedRole.value=="teacher",

                              onTap: () =>controller.selectedRole.value="teacher",
                              height:100 ,
                              width: 100,
                            ),
                            RoleCard(
                              title: 'Parents'.tr,
                              isSelected: controller.selectedRole.value=="parents",

                              onTap: () =>controller.selectedRole.value="parents",
                              height:100 ,
                              width: 100,
                            ),
                          ],
                      ),

                  ),
                  SizedBox(height: 34,),
                  Align(
                    alignment: Get.locale?.languageCode=="ar"
                        ?Alignment.centerRight
                        :Alignment.centerLeft,
                    child: Text(
                      'add  photo'.tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 14,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => ImagePickerCard(
                        label: "Idant Imag".tr,
                        image: controller.personImage.value,
                        onTap: () => controller.pickImage(true),
                        width: 150,
                        height: 100,
                      )),

                      Obx(() => ImagePickerCard(
                        label: "Person Image".tr,
                        image: controller.identityImage.value,
                        onTap: () => controller.pickImage(false),
                        width: 150,
                        height: 100,
                      )),
                    ],
                  ),
                  SizedBox(height: 24,),
                  Obx(
                        () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : CustomButton(
                      text: "continue".tr,
                      icon: Icons.login,
                      onPressed: () =>controller.firstregister(),
                    ),
                  )
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}