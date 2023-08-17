import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:futkart/view/constant/ui_data.dart';
import 'package:futkart/view/login_status.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final String uid;

  @override
  void initState() {
    // getdata();
    super.initState();
  }

  // void getdata()async {
  //   uid = await Helper.getUserIdData();
  //   print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< object >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  //   print(uid);
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Futcart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          backgroundColor: Colors.white,
          duration: 2000,
          splash: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(applogoImage, height: 180, width: 240),
            ],
          ),
          splashIconSize: 180,
          nextScreen: const LoginStatus(),
          // nextScreen: LoginScreen(),
          splashTransition: SplashTransition.scaleTransition,
        ));
  }
}
