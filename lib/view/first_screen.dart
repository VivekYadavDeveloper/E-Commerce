import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:futkart/view/widgets/custom_buttton.dart';
// import 'package:inductusjobs/view/widgets/custom_buttton.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              SizedBox(
                height: 100,
                child: DefaultTextStyle(
                  style: const TextStyle(
                  fontSize: 27.0,
                  fontFamily: 'Solitreo',
                  color: Colors.blue

                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('get hired...'),
                  ],
                ),
                ),
              ),
            const SizedBox(height: 80),
            Image.asset('images/Inductus Human Capital Solutions.png', height: 115, width: 140),
            const Text('Inductusjobs',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25
                    ),
            ),
            const SizedBox(height: 80),
            CustomButton(
              btname: "Login",
            ),
            const SizedBox(height: 15),
            CustomButton(
              btname: "Create account",
            ),
          ],
        ),
      )
    );
  }
}