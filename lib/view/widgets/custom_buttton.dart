import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  double? width = double.infinity;
  String? btname;
  Function()? onTap;
  CustomButton({super.key, this.width, this.btname, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50,
        
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(3))
        ),
        child: Center(
          child: Text(
            btname!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}