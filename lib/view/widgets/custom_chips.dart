import 'package:flutter/material.dart';
import 'package:futkart/view/widgets/custom_text.dart';
// import 'package:inductusjobs/view/widgets/custom_text.dart';

class CustomChips extends StatelessWidget {
  String? label;
  CustomChips({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    // return Chip(
    //   labelPadding: EdgeInsets.all(2.0),
    //   // avatar: CircleAvatar(
    //   //   backgroundColor: Colors.white70,
    //   //   child: Text(label[0].toUpperCase()),
    //   // ),
    //   label: Text(
    //     label!,
    //     style: const TextStyle(
    //       color: Colors.white,
    //       fontSize: 12
    //     ),
    //   ),
    //   backgroundColor: Colors.blue,
    //   elevation: 2.0,
    //   shadowColor: Colors.grey[60],
    //   padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
    // );
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.blue, width: 1),
        ),
        child: CustomText(
          text: label,
          fontSize: 16,
        ));
  }
}
