// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


import '../../color/color.dart';
import 'order_details.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  ColorSelect colorObj = ColorSelect();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorObj.pruple,
        title: Text("My Orders",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderDetails()),
              );
            },
            child: Container(
              height: 120,
              child: Row(
                children: [
                  Image.asset(
                    "assets/banner/ata.png",
                    width: 100,
                    height: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Delivered on Dec 13,2022",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Icon(Icons.keyboard_arrow_right_sharp),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Atta multi grain 2kg"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
