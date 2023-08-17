import 'dart:io';
import 'package:flutter/material.dart';
import 'package:futkart/constants/url.dart';
import 'package:futkart/controller/user_controller.dart';
import 'package:futkart/model/login_model.dart';
import 'package:futkart/services/helper.dart';
import 'package:futkart/view/address_list_screen.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:futkart/view/login_screen.dart';
import 'package:futkart/view/my_favourites_screen.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/wishlist_screen.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAccountTab extends StatefulWidget {
  String? userId;
  MyAccountTab({super.key, this.userId});

  @override
  State<MyAccountTab> createState() => _MyAccountTabState();
}

class _MyAccountTabState extends State<MyAccountTab> {
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    // String a =  Helper.getTokenData() as String;
    // print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
    // print(a);
    // var myInt = int.parse(a!);
    // assert(myInt is int);
    // userController.fetchUserData("50");
    // TODO: implement initState
    super.initState();
  }

  Future<void> urllauncher(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "can not launch";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Obx(() {
          if (userController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          return ListView(
            children: [
              const SizedBox(height: 10),
              // const Center(
              //   child: CircleAvatar(
              //     backgroundColor: Colors.red,
              //     radius: 60,
              //   ),
              // ),
              // Center(
              //       child: Stack(
              //         children:  [
              //           CircleAvatar(
              //             backgroundColor: mainColor,
              //             radius: 80,
              //             child: const CircleAvatar(
              //               radius: 78,
              //               backgroundColor: Colors.white,
              //             )
              //           ),
              //           Positioned(
              //             right: 0,
              //             bottom: 0,
              //             child: CircleAvatar(
              //               radius: 22,
              //               backgroundColor: mainColor,
              //               child: CircleAvatar(
              //                 radius: 20,
              //                 backgroundColor: Colors.white,
              //                 child: Icon(Icons.camera_alt_outlined, color: mainColor,)
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              // const SizedBox( height: 15),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 40,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 39,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        )),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: userController.user.value.firstName.toString() +
                            userController.user.value.lastName.toString(),
                        fontSize: 21,
                        fontweight: FontWeight.w500,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CustomText(
                        text: userController.user.value.email.toString(),
                        fontSize: 15,
                        fontweight: FontWeight.w300,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // InkWell(
                          //   onTap: () {},
                          //   child: Container(
                          //       height: 30,
                          //       width: 70,
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           border: Border.all(width: 1, color: Colors.redAccent),
                          //           borderRadius: const BorderRadius.all(
                          //             Radius.circular(3),
                          //           )),
                          //       child: Center(
                          //         child: CustomText(
                          //           text: "View",
                          //           fontSize: 12,
                          //         ),
                          //       )),
                          // ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // InkWell(
                          //   onTap: () {},
                          //   child: Container(
                          //       height: 25,
                          //       width: 60,
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           border: Border.all(
                          //               width: 1, color: Colors.redAccent),
                          //           borderRadius: const BorderRadius.all(
                          //             Radius.circular(3),
                          //           )),
                          //       child: Center(
                          //         child: CustomText(
                          //           text: "Edit",
                          //           fontSize: 12,
                          //         ),
                          //       )),
                          // )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              // Center(
              //   child: CustomText(
              //     text: "Rahul Kumar",
              //     fontSize: 20,
              //     fontweight: FontWeight.w500,
              //   ),
              // ),
              // const SizedBox(height: 15),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //           height: 30,
              //           width: 70,
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               border: Border.all(width: 1, color: Colors.redAccent),
              //               borderRadius: const BorderRadius.all(
              //                 Radius.circular(3),
              //               )),
              //           child: Center(
              //             child: CustomText(
              //               text: "View",
              //               fontSize: 12,
              //             ),
              //           )),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //           height: 30,
              //           width: 70,
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               border: Border.all(width: 1, color: Colors.redAccent),
              //               borderRadius: const BorderRadius.all(
              //                 Radius.circular(3),
              //               )),
              //           child: Center(
              //             child: CustomText(
              //               text: "Edit",
              //               fontSize: 12,
              //             ),
              //           )),
              //     )
              //   ],
              // ),
              const SizedBox(height: 40),
              // listtile(Icons.abc, "My Orders", () {}),
              // const Divider(
              //   // height: 40,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   child: listtile(Icons.favorite_border, "My Wishlist", () {
              //     Get.to(WishlistScreen());
              //   }),
              // ),
              const Divider(
                  // height: 40,
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.to(AddressListScreen(
                      userDataM: userController.user.value,
                    ));
                  },
                  child: listtile(Icons.location_city, "My Address"),
                ),
              ),
              const Divider(
                  // height: 40,
                  ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   child: listtile(Icons.password, "Change Password"),
              // ),
              // const Divider(
              //   // height: 40,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () async {
                    urllauncher("www.futcart.com");
                  },
                  child: listtile(
                    Icons.keyboard_return_sharp, "Return Policy",
                    // () async {
                    //   var uri = Uri( scheme: "https", host: termAndCondition);

                    // if (await canLaunchUrl(uri)){
                    // await launchUrl(uri, mode: LaunchMode.externalApplication);
                    // } else {
                    // can't launch url
                    //   print("error during launching url");
                    // }
                    // }
                  ),
                ),
              ),
              const Divider(
                  // height: 40,
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () async {
                    urllauncher("www.futcart.com");
                  },
                  child: listtile(
                    Icons.note_sharp, "Privacy Policy",
                    // () async {
                    // var uri = Uri( scheme: "https", host: privacyAndPolicy, path: 'headers/');
                    // if (await canLaunchUrl(uri)){
                    // await launchUrl(uri, mode: LaunchMode.externalApplication);
                    // } else {
                    // can't launch url
                    //   print("error during launching url");
                    // }
                    // }
                  ),
                ),
              ),
              const Divider(
                  // height: 40,
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () async {
                    urllauncher("www.futcart.com");
                  },
                  child: listtile(
                    Icons.abc, "About Us",
                    // () async {
                    // var uri = Uri( scheme: "https", host: aboutUs);
                    // if (await canLaunchUrl(uri)){
                    // await launchUrl(uri, mode: LaunchMode.externalApplication);
                    // } else {
                    // can't launch url
                    //   print("error during launching url");
                    // }

                    // }
                  ),
                ),
              ),
              const Divider(
                  // height: 40,
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: listtile(
                  Icons.star_outline_rounded,
                  "Rate Us",
                ),
              ),
              const Divider(
                  // height: 40,
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    // Share.share('check out my website https://example.com');
                    Share.share('check out my website https://example.com',
                        subject: 'Look what I made!');
                  },
                  child: listtile(
                    Icons.share,
                    "Share",
                  ),
                ),
              ),
              const Divider(
                  // height: 40,
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                        title: "Logout",
                        content: Column(
                          children: [
                            CustomText(
                                text: "Are you sure you want to log out?"),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Helper.deleteUserIdData();
                                      Get.offAll(LoginScreen());
                                    },
                                    child: Text("Confirm")),
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("Cancle"))
                              ],
                            )
                          ],
                        ));
                  },
                  child: listtile(
                    Icons.logout,
                    "Logout",
                  ),
                ),
              ),
              const Divider(
                  // height: 40,
                  ),
              const SizedBox(height: 20),
              Center(
                child:
                    CustomText(text: "2.1.1", fontSize: 12, color: Colors.blue),
              ),
              const SizedBox(height: 10),
            ],
          );
        }));
  }
}

Widget listtile(IconData icon, String title) {
  return InkWell(
    child: Container(
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.redAccent,
          ),
          const SizedBox(width: 10),
          CustomText(
            text: title,
          )
        ],
      ),
    ),
  );
}
