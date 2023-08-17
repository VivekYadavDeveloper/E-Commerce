import 'package:flutter/material.dart';
import 'package:futkart/controller/auth_controller.dart';
import 'package:futkart/services/auth_service.dart';
import 'package:futkart/services/helper.dart';
import 'package:futkart/view/constant/ui_data.dart';
import 'package:futkart/view/signup_screen.dart';
import 'package:futkart/view/forgot_password_screen.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/custom_textfeild.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  String? email;
  String? password;

  LoginScreen({super.key, this.email, this.password});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCon =
      TextEditingController(text: "vikas@gmail.com");
  final TextEditingController _passCon = TextEditingController(text: "123@123");
  bool pasFlag = true;
  bool loading = false;

  // final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Image.asset(applogoImage, height: 150, width: 200),
                CustomTextfeild(
                  controller: _emailCon,
                  hintText: "Email id",
                  validator: (value) {
                    if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value!)) {
                      return "Invalid email";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _passCon,
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password should be atleast 6 characters";
                    } else {
                      return null;
                    }
                  },
                  maxLines: 1,
                  obscureText: pasFlag,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          pasFlag = !pasFlag;
                        });
                      },
                      icon: pasFlag
                          ? const Icon(Icons.visibility, color: Colors.grey)
                          : const Icon(Icons.visibility_off,
                              color: Colors.grey),
                    ),
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const ForgotPasswordScreen());
                      // Get.to(const HtmlTest());
                    },
                    child: CustomText(
                      text: 'Forgot password ?',
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      //** Login Api Call Here **//
                      AuthApiServices.loginTokenapi(
                        _emailCon.text.toString(),
                        _passCon.text.toString(),
                      ).then((value) async => {
                            if (value.jwtToken == null)
                              {
                                setState(() {
                                  loading = false;
                                }),
                                print("Token nhi mila"),
                                Get.snackbar(
                                    "Login", "Invalid email or password",
                                    colorText: Colors.white,
                                    backgroundColor:
                                        const Color.fromRGBO(42, 42, 76, 1),
                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    duration: const Duration(seconds: 2))
                              }


                            //** Get UserID Api **//
                            else
                              {
                                print("Token mil gya"),
                                AuthApiServices.getUserid(
                                  _emailCon.text.toString(),
                                ).then((data) async {
                                  // print("user id mil gye");
                                  if (data[0].id != null) {
                                    print("user id mil gye");

                                    //** Call SharePreferences **//
                                    await Helper.saveUserIdData(
                                        data[0].id.toString());
                                    Get.offAll(HomeScreen(
                                      uIid: data[0].id.toString(),
                                    ));
                                  } else {
                                    Get.snackbar("Login", "Unable to get user",
                                        colorText: Colors.white,
                                        backgroundColor:
                                            const Color.fromRGBO(42, 42, 76, 1),
                                        snackPosition: SnackPosition.BOTTOM,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        duration: const Duration(seconds: 2));
                                  }
                                  setState(() {
                                    loading = false;
                                  });
                                }),
                              }
                          });
                    } else {
                      print("Not Validated");
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Center(
                        child: !loading
                            ? const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              )),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don't have an account ?",
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Get.to(const SignUpScreen());
                      },
                      child: CustomText(
                        text: 'Sign up',
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
