import 'package:flutter/material.dart';
import 'package:futkart/view/widgets/custom_text.dart';

import 'constant/color.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: CustomText(
            // text: candidateApptitle[bindex],
            text: "Product Details",
          ),
        ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Center(
                child: Stack(
                  children:  [
                    CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 80,
                      child: const CircleAvatar(
                        radius: 78,
                        backgroundColor: Colors.white,
                      )
                    ),
                    const Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.camera_alt_outlined, color: Colors.blue,)
                      ),
                    ),
                  ],
                ),
                
              ),
          ],
        )
      )
    );
  }
}