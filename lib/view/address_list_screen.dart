import 'package:flutter/material.dart';
import 'package:futkart/constants/url.dart';
import 'package:futkart/controller/user_controller.dart';
import 'package:futkart/model/user_data_model.dart';
import 'package:futkart/view/edit_or_add_address_screen.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:get/get.dart';

class AddressListScreen extends StatefulWidget {
  
  UserDataModel? userDataM;
  AddressListScreen({super.key, required this.userDataM});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {

  final UserController userController = Get.put(UserController());

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   userController.fetchUserData(50);
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            elevation: 0,
            title: CustomText(
              text: "My Address",
              color: Colors.white,
            )),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              if(userController.isLoading.value)
              return Center(child: CircularProgressIndicator());
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Billing Address ",
                        fontSize: 16,
                        // color: Colors.white,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomText(
                        text: userController.user.value.billing!.firstName.toString() + " " + userController.user.value.billing!.lastName.toString(),
                        fontSize: 13,
                        color: Colors.black45,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: userController.user.value.billing!.address1.toString(),
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 2),
                      widget.userDataM!.billing!.address2.toString == "" ? 
                      
                      CustomText(
                        text: userController.user.value.billing!.address2.toString(),
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ) : SizedBox(), 
                      const SizedBox(height: 2),
                      CustomText(
                        text: userController.user.value.billing!.city.toString() + " " + userController.user.value.billing!.postcode.toString(),
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: userController.user.value.billing!.state.toString(), /*+ " " + userController.user.value.billing!.country.toString(),*/
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: "Email id:- " +userController.user.value.billing!.email.toString(),
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: "Phone no.:- " + userController.user.value.billing!.phone.toString(),
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ///////////////////////////////////////////////////////////   billing buttons
                      InkWell(
                        onTap: () {
                          Get.to(EditAddAddressScreen(
                            appTitle: "Edit Billing Address",
                            btName: "Update",
                            type: "Bill",
                            // userId: userController.user.value.id,
                            userDataM: widget.userDataM,
                          ));
                        },
                        child: Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: Colors.redAccent),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(3),
                                )),
                            child: Center(
                              child: CustomText(
                                text: "Edit",
                                fontSize: 12,
                              ),
                            )),
                      )
                    ],
                  ),
                ),

                Divider(
                  height: 20,
                  thickness: 0.5,
                ),
                //////////////////////////////////////////////////////////////////   shipping address
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Shipping Address ",
                        fontSize: 16,
                        // color: Colors.white,
                        fontweight: FontWeight.w500,
                      ),
                       const SizedBox(
                        height: 12,
                      ),
                      CustomText(
                        text: userController.user.value.shipping!.firstName.toString() + " " + userController.user.value.shipping!.lastName.toString(),
                        fontSize: 13,
                        color: Colors.black45,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: userController.user.value.shipping!.address1.toString(),
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 2),
                      userController.user.value.shipping!.address2.toString() == "" ? 
                      
                      CustomText(
                        text: userController.user.value.shipping!.address2.toString(),
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ) : SizedBox(), 
                      // const SizedBox(height: 2),
                      // CustomText(
                      //   text: widget.userDataM!.billing!.city!.toString(),
                      //   fontSize: 13,
                      //   color: Colors.black38,
                      //   fontweight: FontWeight.w500,
                      // ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: userController.user.value.shipping!.city.toString()+ "  " + userController.user.value.shipping!.postcode.toString(),
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: userController.user.value.shipping!.state.toString(), /*+ "," + widget.userDataM!.shipping!.country.toString(),*/
                        fontSize: 13,
                        color: Colors.black38,
                        fontweight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ///////////////////////////////////////////////////////////  Shipping buttons
                      InkWell(
                        onTap: () {
                          Get.to(EditAddAddressScreen(
                            appTitle: "Edit Shipping Address",
                            btName: "Update",
                            type: "Ship",
                            // userId: 50,
                            userDataM: widget.userDataM,
                          ));
                        },
                        child: Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: Colors.redAccent),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(3),
                                )),
                            child: Center(
                              child: CustomText(
                                text: "Edit",
                                fontSize: 12,
                              ),
                            )),
                      )
                    ],
                  ),
                )
              ],
            );
            })
            
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(0.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           CustomText(
            //             text: "Billing Address ",
            //             fontSize: 16,
            //             // color: Colors.white,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(
            //             height: 12,
            //           ),
            //           CustomText(
            //             text: widget.userDataM!.billing!.firstName.toString() + " " + widget.userDataM!.billing!.lastName.toString(),
            //             fontSize: 13,
            //             color: Colors.black45,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(height: 2),
            //           CustomText(
            //             text: widget.userDataM!.billing!.address1,
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(height: 2),
            //           widget.userDataM!.billing!.address2.toString == "" ? 
                      
            //           CustomText(
            //             text: widget.userDataM!.billing!.address2,
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ) : SizedBox(), 
            //           // const SizedBox(height: 2),
            //           // CustomText(
            //           //   text: widget.userDataM!.billing!.city!.toString(),
            //           //   fontSize: 13,
            //           //   color: Colors.black38,
            //           //   fontweight: FontWeight.w500,
            //           // ),
            //           const SizedBox(height: 2),
            //           CustomText(
            //             text: widget.userDataM!.billing!.city!.toString()+ "  " + widget.userDataM!.billing!.postcode.toString(),
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(height: 2),
            //           CustomText(
            //             text: widget.userDataM!.billing!.state!.toString()+ "," + widget.userDataM!.billing!.country.toString(),
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(height: 2),
            //           CustomText(
            //             text: "Email id:- " +widget.userDataM!.billing!.email!.toString(),
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(height: 2),
            //           CustomText(
            //             text: "Phone no.:- " +widget.userDataM!.billing!.phone!.toString(),
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           ///////////////////////////////////////////////////////////   billing buttons
            //           InkWell(
            //             onTap: () {
            //               // UserService.editBillingAdd(50,"kjsu","jzjnkja","hzb","fjji","ejd","kndnn","njk","nnh","hh","hh");
            //               Get.to(EditAddAddressScreen(
            //                 appTitle: "Edit Billing Address",
            //                 btName: "Update",
            //                 type: "Bill",
            //                 userId: 50,
            //               ));
            //             },
            //             child: Container(
            //                 height: 30,
            //                 width: 70,
            //                 decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     border: Border.all(
            //                         width: 1, color: Colors.redAccent),
            //                     borderRadius: const BorderRadius.all(
            //                       Radius.circular(3),
            //                     )),
            //                 child: Center(
            //                   child: CustomText(
            //                     text: "Edit",
            //                     fontSize: 12,
            //                   ),
            //                 )),
            //           )
            //         ],
            //       ),
            //     ),

            //     Divider(
            //       height: 20,
            //       thickness: 0.5,
            //     ),
            //     //////////////////////////////////////////////////////////////////   shipping address
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           CustomText(
            //             text: "Shipping Address ",
            //             fontSize: 16,
            //             // color: Colors.white,
            //             fontweight: FontWeight.w500,
            //           ),
            //            const SizedBox(
            //             height: 12,
            //           ),
            //           CustomText(
            //             text: widget.userDataM!.shipping!.firstName.toString() + " " + widget.userDataM!.shipping!.lastName.toString(),
            //             fontSize: 13,
            //             color: Colors.black45,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(height: 2),
            //           CustomText(
            //             text: widget.userDataM!.shipping!.address1,
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(height: 2),
            //           widget.userDataM!.shipping!.address2.toString == "" ? 
                      
            //           CustomText(
            //             text: widget.userDataM!.shipping!.address2,
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ) : SizedBox(), 
            //           // const SizedBox(height: 2),
            //           // CustomText(
            //           //   text: widget.userDataM!.billing!.city!.toString(),
            //           //   fontSize: 13,
            //           //   color: Colors.black38,
            //           //   fontweight: FontWeight.w500,
            //           // ),
            //           const SizedBox(height: 2),
            //           CustomText(
            //             text: widget.userDataM!.shipping!.city!.toString()+ "  " + widget.userDataM!.shipping!.postcode.toString(),
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(height: 2),
            //           CustomText(
            //             text: widget.userDataM!.shipping!.state!.toString()+ "," + widget.userDataM!.shipping!.country.toString(),
            //             fontSize: 13,
            //             color: Colors.black38,
            //             fontweight: FontWeight.w500,
            //           ),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           ///////////////////////////////////////////////////////////  Shipping buttons
            //           InkWell(
            //             onTap: () {
            //               Get.to(EditAddAddressScreen(
            //                 appTitle: "Edit Shipping Address",
            //                 btName: "Update",
            //                 type: "Ship",
            //                 userId: 50,
            //               ));
            //             },
            //             child: Container(
            //                 height: 30,
            //                 width: 70,
            //                 decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     border: Border.all(
            //                         width: 1, color: Colors.redAccent),
            //                     borderRadius: const BorderRadius.all(
            //                       Radius.circular(3),
            //                     )),
            //                 child: Center(
            //                   child: CustomText(
            //                     text: "Edit",
            //                     fontSize: 12,
            //                   ),
            //                 )),
            //           )
            //         ],
            //       ),
            //     )
            //   ],
            // )
            // child: Column(
            //   children: [
            //     Expanded(
            //       child: ListView.separated(
            //         itemCount: 10,
            //         itemBuilder: (BuildContext, index) {
            //           return AddressTile(
            //             index+1,
            //             "C-127 SECTOR-2",
            //             "NOIDA 201301",
            //             "UTTAR PRADESH"
            //           );
            //         },
            //         separatorBuilder: (BuildContext context, int index) {
            //           return const Divider(
            //             height: 40,
            //           );
            //         },
            //       ),
            //     ),
            //     const SizedBox(height: 10),
            //     CustomButton(
            //       btname: "Add Address",
            //       onTap: (){
            //         Get.to(EditAddAddressScreen(
            //           appTitle: "Add New Address",
            //           btName: "Add",
            //           )
            //         );
            //       },
            //     )
            //   ],
            // ),
            ));
  }
}

Widget AddressTile(int index, String ad1, String ad2, String ad3) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Address " "$index",
                  fontSize: 16,
                  // color: Colors.white,
                  fontweight: FontWeight.w500,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.black54,
                  radius: 7,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 6,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            CustomText(
              text: ad1 + ",",
              fontSize: 13,
              color: Colors.black45,
              fontweight: FontWeight.w500,
            ),
            const SizedBox(height: 2),
            CustomText(
              text: ad2 + ",",
              fontSize: 13,
              color: Colors.black38,
              fontweight: FontWeight.w500,
            ),
            const SizedBox(height: 2),
            CustomText(
              text: ad3,
              fontSize: 13,
              color: Colors.black38,
              fontweight: FontWeight.w500,
            ),
            const SizedBox(
              height: 20,
            ),
            ///////////////////////////////////////////////////////////  buttons
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // Get.to(EditAddAddressScreen(
                    //   appTitle: "Edit Address",
                    //   btName: "Update",
                    // ));
                  },
                  child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.redAccent),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          )),
                      child: Center(
                        child: CustomText(
                          text: "Edit",
                          fontSize: 12,
                        ),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        radius: 10,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Do you realy want to delete this address",
                              textAlign: TextAlign.center,
                              style: TextStyle(),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.redAccent),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(3),
                                          )),
                                      child: Center(
                                        child: CustomText(
                                          text: "Confirm",
                                          fontSize: 12,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.redAccent),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(3),
                                          )),
                                      child: Center(
                                        child: CustomText(
                                          text: "Cancle",
                                          fontSize: 12,
                                        ),
                                      )),
                                )
                              ],
                            )
                          ],
                        ));
                  },
                  child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.redAccent),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          )),
                      child: Center(
                        child: CustomText(
                          text: "Delete",
                          fontSize: 12,
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      )
    ],
  );
}
