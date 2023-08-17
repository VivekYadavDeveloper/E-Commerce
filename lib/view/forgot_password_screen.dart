import 'package:flutter/material.dart';
import 'package:futkart/services/auth_service.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:futkart/view/widgets/custom_buttton.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/custom_textfeild.dart';
import 'package:get/get.dart';

import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _emailCon = new TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: CustomText(text: 'Forgot Password'),
          backgroundColor: mainColor,
          // iconTheme: const IconThemeData(
          //   color: Colors.black, //change your color here
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.s,
                children: [
                  // CustomText(
                  //   text: 'Forgot Password',
                  //   fontSize: 20,
                  //   fontweight: FontWeight.bold,
                  // ),
                  const SizedBox(height: 25),
                  Text(
                    'Enter your email id to receive\nan OTP to reset your password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff07877D),
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomTextfeild(
                    hintText: "Enter email",
                    controller: _emailCon,
                    validator: (value) {
                      if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value!)) {
                        return "Invalid email";
                      } else
                        return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    btname: isLoading ? "Loading ...": "Get OTP",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Get.to(OtpScreen(email: _emailCon.text) );
                        setState(() {
                        isLoading = true;
                      });
                        AuthApiServices.getResetCode(_emailCon.text)
                            .then((value) {
                              print("/////////////////////////////////////////////////////////");
                              print(value.data!.status.toString());

                            if ( value.data!.status == 200) {
                            Get.offAll(OtpScreen(email: _emailCon.text) );
                            setState(() {
                        isLoading = false;
                      });
                            
                          } else {
                            // _emailCon.clear();
                            print("/////////////////////////////////////////////////////////");
                            print(value.data!.status.toString());
                            setState(() {
                        isLoading = false;
                      });
                            Get.snackbar(
                              "Message",
                              value.message.toString(),
                              icon: Icon(Icons.person, color: Colors.white),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: mainColor,
                              borderRadius: 10,
                              margin: EdgeInsets.all(15),
                              colorText: Colors.white,
                              duration: Duration(seconds: 3),
                              isDismissible: true,
                              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                              forwardAnimationCurve: Curves.easeOutBack,
                            );
                          }
                        });
                      } else {
                        // print("invalid");
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
