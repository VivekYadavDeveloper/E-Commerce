import 'package:flutter/material.dart';
import 'package:futkart/view/widgets/custom_text.dart';
// import 'package:inductusjobs/view/widgets/custom_text.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.settings),
          title: CustomText(

            text: "Settings",
          )
        ),
        ListTile(
          leading: const Icon(Icons.book),
          title: CustomText(
            text: "About",
          )
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: CustomText(

            text: "Contact us",
          )
        ),
        ListTile(
          leading: const Icon(Icons.policy),
          title: CustomText(

            text: "Privacy Policy",
          )
        ),
        ListTile(
          leading: const Icon(Icons.my_library_books_rounded),
          title: CustomText(

            text: "Terms & Conditions",
          )
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: CustomText(

            text: "Logout",
          )
        ),
        const SizedBox(height: 100,),
        Center(
          child: CustomText(
            text: '1.09.02',
          ),
        )
      ],
    );
  }
}