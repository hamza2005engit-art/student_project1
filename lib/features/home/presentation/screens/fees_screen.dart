
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/costum_fees_card.dart';



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
              child: Text("data"))




        ),


        body:Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
children: [
  FeesCard(total: 30, paid: 30, icon: Icons.add_ic_call, total_fess: 30, total_remaining: 30,

  )
],
            )
        )

    );
  }}


