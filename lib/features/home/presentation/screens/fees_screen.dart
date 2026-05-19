
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/costum_fees_card.dart';
import '../../../../core/widget/coustum_totalfees_card.dart';



class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});


  @override
  State<FeesScreen> createState() => _FeesScreenState();
}
class _FeesScreenState extends State<FeesScreen>
    with SingleTickerProviderStateMixin {




  @override
  Widget build(BuildContext context) {


    return Scaffold(

        appBar: AppBar(

          toolbarHeight: 100,
          backgroundColor: const Color(0xFF1C3486),

          title:Align(
            alignment: Alignment.centerLeft,
              child: Text("Fees",style: TextStyle(color: Colors.black),))




        ),


        body:Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
children: [
  TotalFeesCard(
    title: "TOTAL FESS",
    amount: 4000,
  ),
  SizedBox(height: 20,),
  FeesCard(
    total: 3000,
    paid: 1000,
    total_remaining: 2000,
    total_fess: 3000,
    icon: Icons.school,
  )
],
            )
        )

    );
  }}


