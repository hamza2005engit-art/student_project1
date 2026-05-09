
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widget/costum_drobdown.dart';
import '../../../../core/widget/custom_notifincation_card.dart';

import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/next_buttom.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/addnotifincation_controller.dart';
import '../controllers/notfincation_controller.dart';

class NotifincationScreen extends StatefulWidget {
  const NotifincationScreen({super.key});


  @override
  State<NotifincationScreen> createState() => _NotifincationScreenState();
}
class _NotifincationScreenState extends State<NotifincationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AddNotfincationController controller = Get.find<AddNotfincationController>();

  // final TextEditingController titleController = TextEditingController();
  // final TextEditingController conectController = TextEditingController();
  // final TextEditingController gradeController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF1C3486),

        title:

            Text("Notifincations",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 25
            ),
            ),


        ),


      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column (


                    children: [
             TabBar(
            controller: _tabController,
            indicatorColor:Color(0xFF00D4B6),
            labelColor: Color(0xFF00D4B6),
            unselectedLabelColor:
             Theme.of(context).brightness == Brightness.dark
            ? AppColors.bodyFontDark
            : AppColors.textFeildDark,
            tabs: [
              Tab(text:"Notifincations"),
              Tab(text:"Add Notifincation"),
            ]),
Expanded(child: TabBarView(
    controller:_tabController,
    children:[
      SingleChildScrollView(
    padding:const EdgeInsets.all(10),
    child:
    Column(children: [
      SizedBox(height: 25,),
      Align(
        alignment: Alignment.centerLeft,  child: Text(
        "Today",
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.bodyFontDark
              : AppColors.textFeildDark,
        ),
      ),
      ),
      SizedBox(height: 10,),

      NotifincationCard(
        bottom: "viwe",
        title: "hamza",
        conict: "xcvbnm fghjk  njnjjhhbhhvhvghvgv bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb  ",
        icon: Icons.volume_up,
        height: 100,
        width: 200,
        date: DateTime.now(),
      ),

      SizedBox(height: 25,),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
        "Yasterday",
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.bodyFontDark
              : AppColors.textFeildDark,
        ),
      ),
      ),
      SizedBox(height: 10,),

      NotifincationCard(
        bottom: "viwe",
        title: "hamza",
        conict: "xcvbnm fghjk nnnn  ",
        icon: Icons.volume_up,
        height: 100,
        width: 200,
        date: DateTime.now(),
      ),

      SizedBox(height: 100,),

   NextButton(
     onTap: () {}
   ),



    ],),
    
  ),



      ListView(
        children: [
          SizedBox(height: 20,),

          Align(
              alignment: Alignment.centerLeft,
              child:
Text("Notifincatin Cration ",
  style: TextStyle(
    color: Theme.of(context).brightness == Brightness.dark
        ? AppColors.tecnotfincatinDark
        : AppColors.primaryLight,
    fontSize: 30
  ),

),),

          SizedBox(height: 6,),

          Align(
            alignment: Alignment.centerLeft,
            child:
            Text("add new notfincation for ehter student or class.",
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.bodyFontDark
                      : AppColors.labelFontLight,

              ),

            ),),
          SizedBox(height: 30,),
Container(

  height: 100,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
  ),
  child:ClipRRect(
   borderRadius:BorderRadius.circular(15) ,
    child: Image.asset('assets/images/Gemini_Generated_Image_dli9x8dli9x8dli9.png',
    fit: BoxFit.cover,
    ),
  ) ,
),

          SizedBox(height: 30,),

          CustomTextField(
            controller:controller.titleController,
            label: "notifincation title",
            hintText: "the title of notifincation title bold..",

          ),

          SizedBox(height: 30,),

          CustomTextField(
            controller: controller.conectController,
            label: "Discrabtion",
            hintText: "the title of notifincation title bold..",
            maxLines: 5,

          ),

          SizedBox(height: 30,),
          Obx(() => CustomDropdown<String>(
            label: "Grade",
            hintText: "اختر الصف",
            value: controller.selectedGrade.value,
            items: controller.grades,
            itemLabel: (grade) => grade,
            onChanged: (value) {
              controller.selectedGrade.value = value;
              controller.loadStudents(value!);
            },
          )),

          const SizedBox(height: 16),

// Dropdown الطالب
          Obx(() => CustomDropdown<String>(
            label: "student",
            hintText: "اختر الطالب",
            value: controller.selectedStudent.value,
            items: controller.students,
            itemLabel: (grade) => grade,
            onChanged: (value) {
              controller.selectedStudent.value = value;
              controller.loadStudents(value!);
            },
          )),
          SizedBox(height: 100,),

          NextButton(
              onTap: () {}
          ),
        ]


      )
  
])
)


                     ]



        ),
      )




    );
  }
}
