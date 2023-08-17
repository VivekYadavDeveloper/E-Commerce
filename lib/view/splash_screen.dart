import 'package:flutter/material.dart';
import 'package:futkart/view/constant/ui_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    
  // @override
  // initState () {
  //   super.initState();
  //   Timer(
  //       const Duration(seconds: 3),
  //       () => Navigator.of(context).pushReplacement(MaterialPageRoute(
  //           builder: (BuildContext context) => const LoginScreen())));
  // }
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(applogoImage),
        )

      )
    );
  }
}