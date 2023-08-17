import 'package:flutter/material.dart';
import 'package:futkart/services/auth_service.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:futkart/view/home_screen.dart';
import 'package:futkart/view/login_screen.dart';
import 'package:futkart/view/widgets/custom_buttton.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/custom_textfeild.dart';
import 'package:get/get.dart';


class NewPasswordScreen extends StatefulWidget {
  String email;
  String otp;
  NewPasswordScreen({super.key, required this.email, required this.otp});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _passCon = new TextEditingController();
  final TextEditingController _confirmPassCon = new TextEditingController();
  // String? pass;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          title: CustomText(
            text: 'Create New Password',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CustomText(
                  //   text: 'Create New Password',
                  //   fontSize: 25,
                  //   // color: Colors.black,
                  //   fontweight: FontWeight.bold,
                  // ),
                  // const SizedBox(height: 15),
                  // const Text(
                  //   'Enter your email/phone to receive\nan email to reset your password',
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       // fontWeight: ,
                  //       color: Color(0xff07877D)
                  //   ),
                  // ),
                  const SizedBox(height: 50),
                  CustomTextfeild(
                    hintText: "New password",
                    controller: _passCon,
                    validator: (value) {
                            if (value!.length < 6) {
                              return "Password should be atleast 6 characters";
                            } else {
                              return null;
                            }
                          },
                  ),
                  // const SizedBox(height: 15),
                  // CustomTextfeild(
                  //   hintText: "Confirm password",
                  //   controller: _confirmPassCon,
                  //   validator: (value) {
                  //     var pass = _passCon;
                  //     if (pass != value) {
                  //       return "Password mismatched";
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  // ),
                  const SizedBox(height: 25),
                  CustomButton(
                    btname: loading ? "Loading ..." :"Create",
                    onTap: () {
                      // Get.to( NewPasswordScreen() );
                      if (_formKey.currentState!.validate()) {


                        setState(() {
                        loading = true;
                      });
                        AuthApiServices.resetPassword( widget.email, widget.otp, _passCon.text)
                            .then((value) {
                          if (value.data!.status == 200) {
                            setState(() {
                        loading = false;
                      });
                            Get.off(LoginScreen());
                          } else {
                            setState(() {
                        loading = false;
                      }
                      );
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


                        
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                    },
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
