import 'package:flutter/material.dart';
import 'package:ow_tech_core/buyer_side/User_interface/widgets/layout_page.dart';

import '../../../main.dart';
import '../widgets/hr.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                   hr(),
                  const Text(
                    'Select Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const hr(),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Your onPressed logic goes here
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: Size(150, 50), // Set the desired width and height
                        ),
                        child: Text(
                          "Buyer",
                          style: TextStyle(color: mainBackupColor),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: Size(150, 50),
                        ),
                        child: Text("Seller",style: TextStyle(color: mainBackupColor),),
                      ),
                    ],
                  ),
                  const hr(),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: Size(200, 50),
                    ),
                    child: Text("Both",style: TextStyle(color: mainBackupColor),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
