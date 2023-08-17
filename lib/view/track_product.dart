import 'package:flutter/material.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'constant/color.dart';

class TrackProduct extends StatelessWidget {
  TrackProduct({super.key});


  List<String> trackValue= [
    "hjx",
    ";kljhfd",
    "jhdgdfd"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: CustomText(
          text: "Track order",
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: Container(
        // child: Stepper(
        //   steps: List<Step>.generate(
        //     trackValue.length,
        //     (index) {
        //       return Step(
        //         isActive: false,
        //         title: Text(trackValue[index].toString()), 
        //         content: Text("step 1"), 
        //       );
        //     }
        //   ),
        // )
        
      )
    );
  }
}
