import 'package:flutter/material.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:futkart/view/widgets/custom_text.dart';

class SizeChartScreen extends StatelessWidget {
  String? appbarTitle;
  SizeChartScreen({super.key, this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
          title: CustomText(
        text: appbarTitle,
        color: Colors.white,
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset(
            'images/SIZE-CHART-new.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
