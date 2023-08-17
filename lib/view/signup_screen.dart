import 'package:flutter/material.dart';
import 'package:futkart/services/auth_service.dart';
import 'package:futkart/services/helper.dart';
import 'package:futkart/view/add_address_screen.dart';
import 'package:futkart/view/home_screen.dart';
import 'package:futkart/view/login_screen.dart';
import 'package:futkart/view/widgets/custom_buttton.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/custom_textfeild.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? pass;
  bool isLoading = false;
  bool pasFlag = false; //  for hide/unhide password
  bool conpasFlag = false; // for hide/unhide confirm password
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController nameCon = new TextEditingController();
  final TextEditingController phoneCon = new TextEditingController();
  final TextEditingController emailCon = new TextEditingController();
  final TextEditingController passCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/Futcart-logo.png', height: 150, width: 200),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextfeild(
                          controller: nameCon,
                          hintText: "Name",
                          validator: (value) {
                            if (value!.length < 3) {
                              return "Name should be atleast 3 char";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomTextfeild(
                          controller: emailCon,
                          hintText: "Email id",
                          validator: (value) {
                            if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value!)) {
                              return "Incorrect email id";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomTextfeild(
                          controller: phoneCon,
                          hintText: "Phone no.",
                          validator: (value) {
                            if (value!.length != 10) {
                              return "Invalid phone";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: passCon,
                          validator: (value) {
                            if (value!.length < 6) {
                              pass = value;
                              return "Password should be atleast 6 characters";
                            } else {
                              pass = value;
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
                                  ? const Icon(Icons.visibility,
                                      color: Colors.grey)
                                  : const Icon(Icons.visibility_off,
                                      color: Colors.grey),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if (value != pass) {
                              return "Password mismatched";
                            } else {
                              return null;
                            }
                          },
                          maxLines: 1,
                          obscureText: conpasFlag,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Confirm password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  conpasFlag = !conpasFlag;
                                });
                              },
                              icon: conpasFlag
                                  ? const Icon(Icons.visibility,
                                      color: Colors.grey)
                                  : const Icon(Icons.visibility_off,
                                      color: Colors.grey),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 25),
                        CustomButton(
                          btname: isLoading ? "Loading ..." : "Create",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              AuthApiServices.register(
                                      nameCon.text.toString(),
                                      emailCon.text.toString(),
                                      phoneCon.text.toString(),
                                      passCon.text.toString())
                                  .then((value) async => {
                                    // print("user created"),
                                        if (value.id != null)
                                          {
                                            print("user created"),
                                            print("User Id"+value.id.toString()),
                                            await Helper.saveUserIdData(value.id.toString()).then((a){

                                              // Get.offAll(HomeScreen(uIid: value.id.toString()));
                                              Get.offAll(AddAddressScreen(uid: value.id.toString()));
                                            }),
                                            setState(() {
                                              isLoading = false;
                                            }),
                                          }
                                        else
                                          {
                                            setState(() {
                                              isLoading = false;
                                            }),
                                            Get.snackbar("Sign Up",
                                                "An account is already registered with your email address",
                                                colorText: Colors.white,
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        42, 42, 76, 1),
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                duration:
                                                    const Duration(seconds: 2))
                                          }
                                      });
                            }
                          },
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Already have an account ?",
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Get.offAll(LoginScreen());
                              },
                              child: CustomText(
                                text: 'Login',
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
            ],
          ),
        ));
  }
}
