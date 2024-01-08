// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Otp Verify"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OTP Verification",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter the OTP sent to your number",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "0",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "0",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "0",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    child: TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "0",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "0",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "0",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
