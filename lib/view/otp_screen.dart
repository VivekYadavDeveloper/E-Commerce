import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:futkart/services/auth_service.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:futkart/view/widgets/custom_buttton.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'new_password_screen.dart';
// import 'package:inductusjobs/view/new_password_screen.dart';
// import 'package:inductusjobs/view/widgets/custom_buttton.dart';
// import 'package:inductusjobs/view/widgets/custom_text.dart';

class OtpScreen extends StatefulWidget {
  String email;
  OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          title: CustomText(
            text: 'Verify code',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                OtpTextField(
                  numberOfFields: 4,
                  fieldWidth: 55,
                  borderWidth: 1,
                  filled: true,
                  fillColor: const Color(0xffE3EBEE),
                  focusedBorderColor: Colors.black,
                  borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                  showFieldAsBox: true,
                  textStyle: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w300
                  ),
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                    print(
                        "//////////////////////////////////////////     ,typed");
                    print(code);
                  },
                  //runs when every textfield is filled
                  onSubmit: (String varificationCode) {
                      setState(() {
                        loading = true;
                      });
                        AuthApiServices.validateResetCode( widget.email, varificationCode)
                            .then((value) {
                          if (value.data!.status == 200) {
                            setState(() {
                        loading = false;
                      });
                            Get.offAll(NewPasswordScreen( email: widget.email, otp:varificationCode));
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











                    // check = true;
                    // Get.to(const NewPasswordScreen());
                    // Get.to(HomeScreen());
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: const Text("Verification Code"),
                    //         content: Text('Code entered is $verificationCode'),
                    //       );
                    //     });
                  }, // end onSubmit
                ),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: 'Resend code',
                    fontSize: 16,
                    color: const Color(0xff07877D),
                  ),
                ),

                const SizedBox(height: 10),
                loading ? CircularProgressIndicator() : SizedBox() 
                // CustomButton(
                //   btname: "Verify",
                //   onTap: () {
                //     if (check == true) {
                //       Get.to(const NewPasswordScreen());
                //     } else {
                //       GetSnackBar(
                //         titleText: CustomText(
                //           text: "OTP",
                //           color: Colors.black,
                //           fontSize: 18,
                //           fontweight: FontWeight.bold,
                //         ),
                //         messageText: CustomText(
                //           text: "Invalid otp",
                //           color: Colors.black,
                //         ),
                //         duration: const Duration(seconds: 2),
                //         backgroundColor: Colors.white,
                //         borderRadius: 10,
                //         margin: const EdgeInsets.symmetric(
                //             vertical: 15, horizontal: 15),
                //         barBlur: 1.0,
                //       );
                //     }
                //   },
                // )
              ],
            ),
          ),
        )
    );
  }
}
