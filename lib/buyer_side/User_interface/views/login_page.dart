import 'package:flutter/material.dart';
import 'package:ow_tech_core/buyer_side/User_interface/views/register_page.dart';
import 'package:ow_tech_core/buyer_side/User_interface/views/select_category.dart';

import '../../../main.dart';
import '../../blocs/user_authentication.dart';
import '../../models/user_validation.dart';
import '../widgets/animated_avatar.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/hr.dart';
import '../widgets/layout_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with UserValidation {
  bool _keepSesion = false;
  bool _isObscure = true;

  TextEditingController dniTFController = TextEditingController();
  TextEditingController passTFController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  'OW TECH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(child: const AnimatedAvatar()),
                        const hr(height: 24),
                        TextFormField(
                          controller: dniTFController,
                          validator: (value) => isDNI(value) ? 'Incorrect User Name' : null,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            hintText: 'Enter User Name',
                            // Hide the border
                            border: InputBorder.none,
                          ),
                        ),


                        // CustomTextField(
                        //     validator: (value) => isDNI(value)
                        //         ? 'Incorrect User Name'
                        //         : null,
                        //     controller: dniTFController,
                        //     icon: Icons.person,
                        //     hint: 'User Name'),
                        const hr(),
                        // CustomTextField(
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'Incorrect Password';
                        //       }
                        //       return null;
                        //     },
                        //     controller: passTFController,
                        //     icon: Icons.lock,
                        //     hint: 'Password',
                        //     passType: true,
                        // ),
                        TextFormField(
                          controller: passTFController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon:  Icon(
                              Icons.lock,
                            ),
                            hintText: "Enter Password",
                            border: InputBorder.none,

                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                      () {
                                        _isObscure = !_isObscure;
                                  },
                                );
                              },
                            ),
                            alignLabelWithHint: false,
                            filled: true,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                        ),

                        const hr(height: 15),

                        Text("Forgot Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        const hr(height: 5),

                        Center(
                          child: SizedBox(
                            width: 200, // Adjust the width as needed
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mainBackupColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () => LoginValidation().loginUser(
                                dniTFController.text,
                                passTFController.text,
                                _keepSesion,
                                _formKey,
                                context,
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                       // const hr(height: 5),
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SelectCategory()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Registration',
                                style: TextStyle(color: mainBackupColor),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  )),


            ],
          ),
        ),
      ),
    );
  }
}
