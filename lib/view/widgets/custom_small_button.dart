import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  int? width;
  String? btname;
  Function()? onTap;
  CustomSmallButton({super.key, this.width, this.btname, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: double.infinity,
        // height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Center(
          child: Text(
            btname!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
          ),
        ),
      ),
    );
  }
}