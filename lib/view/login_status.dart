import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:futkart/services/helper.dart';
import 'package:futkart/view/home_screen.dart';
import 'package:futkart/view/login_screen.dart';

class LoginStatus extends StatefulWidget {
  const LoginStatus({super.key});

  @override
  State<LoginStatus> createState() => _LoginStatusState();
}

class _LoginStatusState extends State<LoginStatus> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Helper.getUserIdData(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          String uid = snapshot.data as String;
          
          if(uid.isEmpty){
            print("empty user id");
            return LoginScreen();
          }else {
            print("/user id"+ uid);
            return HomeScreen(uIid: uid);
          }
        }    else {
          return Container();
        }      
      }
    );
  }
}