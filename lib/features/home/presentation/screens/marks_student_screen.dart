


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';

import '../../../../core/widget/costum_exercises_card.dart';
import '../../../../core/widget/costum_gridmarks.dart';
import '../../../../core/widget/costum_navbar.dart';
import '../../../../core/widget/costum_totaacademi.dart';
import '../../../../core/widget/custom_notifincation_card.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/addnotifincation_controller.dart';
import '../controllers/navbar_controller.dart';


class MarksStudentScreen extends StatefulWidget {
  const MarksStudentScreen({super.key});


  @override
  State<MarksStudentScreen> createState() => _NotifincationScreenState();
}
class _NotifincationScreenState extends State<MarksStudentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AddNotfincationController controller = Get.find<AddNotfincationController>();
  final NavBarController navarController = Get.find<NavBarController>();

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






      bottomNavigationBar:
      Obx(()=>
         NavBar(
          currentIndex: navarController.currentIndex.value,
          onTap: (index){
            navarController.currentIndex.value=index;
            switch(index){
              case 0:
              Get.toNamed(Routes.MARKS);
              break;
              case 1:
              Get.toNamed(Routes.NOTIFICATION);
              break;
              case 2:
              Get.toNamed(Routes.HOME);
              break;
              case 3:
              Get.toNamed(Routes.HELLO3);
              break;
              case 4:
              Get.toNamed(Routes.PROFILE);
              break;
            }
          },

        ),
      ),














      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

          ],
        ),
      ),
        appBar: AppBar(

          toolbarHeight: 100,
          backgroundColor: const Color(0xFF1C3486),

          title:

          Row(
            children: [



              Container(

                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child:ClipRRect(
                  borderRadius:BorderRadius.circular(60) ,
                  child: Image.asset('assets/images/Gemini_Generated_Image_dli9x8dli9x8dli9.png',
                    fit: BoxFit.cover,
                  ),
                ) ,
              ),
              SizedBox(width: 15,),
              Text("Hamza",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 25
                ),
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined),)


            ],
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
                Tab(text:"Marks"),
                Tab(text:"Exercise"),
              ]),
                Expanded(child: TabBarView(
                    controller:_tabController,
                    children:[

                        ListView(children: [
                          SizedBox(height: 20,),
Text("My Marks",
style: TextStyle(
  color:  Theme.of(context).brightness == Brightness.dark
      ? AppColors.mymarksDark
      : AppColors.mymarksLight,
  fontSize:30
),
),
                          SizedBox(height: 20,),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: SfDataGrid(
                              source: MarksDataSource(),
                              gridLinesVisibility: GridLinesVisibility.both, // ← هذا
                              headerGridLinesVisibility: GridLinesVisibility.both, //
                              columnWidthMode: ColumnWidthMode.fill,
                              columns: [
                                GridColumn(
                                  columnName: 'subject',
                                  label: Container(
                                    color: const Color(0xFF1C3486),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Subject',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'exercises',
                                  label: Container(
                                    color: const Color(0xFF1C3486),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Exercises',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'test',
                                  label: Container(
                                    color: const Color(0xFF1C3486),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Test',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'final',
                                  label: Container(
                                    color: const Color(0xFF1C3486),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Final',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                GridColumn(
                                  columnName: 'total',
                                  label: Container(
                                    color: const Color(0xFF1C3486),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Total',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                           const SizedBox(height: 16,),
                          totalacademi( total_acdemi: "60", class_rank:"8" , degre: 'A',)



                        ],),





                      ListView(
                          children: [
                            SizedBox(height: 20,),
                            ExercisesCard(title: 'serdfthujihgvch',
                              conict: 'wertyuiol,mnbvcdfgyjmnbjmnbhjnbhnbnbvbhbvbvbvvvbbbbbbbbbbbbbbbbbbb',
                              icon: Icons.notes,
                              grade: '8/10',

                              date: DateTime.now(),)

                          ]


                      )

                    ])
                )

                ,])
        )

    );
  }}


