import 'package:flutter/material.dart';
import 'package:futkart/constants/url.dart';
import 'package:futkart/controller/cart_controller.dart';
import 'package:futkart/controller/order_list_controller.dart';
import 'package:futkart/controller/user_controller.dart';
import 'package:futkart/view/edit_or_add_address_screen.dart';
import 'package:futkart/view/widgets/cart_list_tile.dart';
import 'package:futkart/view/widgets/custom_buttton.dart';
import 'package:futkart/view/widgets/custom_text.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartListController = Get.put(CartController());
  final OrderListController orderController = Get.put(OrderListController());
  final UserController userController = Get.put(UserController());

  var _razorpay = Razorpay();

  // CartDBModel cartItem = cartListController.cartList.value as CartDBModel;

  @override
  void initState() {
    cartListController.getCart();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // totalCart();
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    print("success");
    orderController.createOrder(
        userController.user.value.id.toString(),
        userController.user.value,
        cartListController.cartList,
        response.paymentId.toString());
    cartListController.deleteCartTable();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    print("failed");
    Get.snackbar("Payment Failed", "Sorry, your payment has failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    print("external wallet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            elevation: 0,
            title: CustomText(
              text: "My Cart",
              color: Colors.white,
            )),
        bottomNavigationBar: Obx(() {
          return Container(
              padding: const EdgeInsets.all(8),
              height: 100,
              // height: 70,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cartListController.cartList.isEmpty
                          ? const SizedBox()
                          : CustomText(
                              text:
                                  "total: ₹ ${cartListController.totalAmount}",
                              color: Colors.green,
                              fontSize: 18,
                            ),
                      // InkWell(
                      //   onTap: () {
                      //                   // Get.to(TrackProduct());
                      //   },
                      //   child: CustomText(
                      //     text: "View detail", color: Colors.blue, fontSize: 12, ),
                      //   )
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    btname: cartListController.cartList.isEmpty
                        ? "Empty cart "
                        : "Proceed to Payment",
                    onTap: () {
                      if (cartListController.cartList.isNotEmpty) {
                        var options = {
                          // 'key': 'rzp_test_cGGXwbUTKhIaLv',      //  rzpKey (variable that holds key value)
                          'key': rzpKey,
                          'amount': cartListController.totalAmount * 100,
                          //in the smallest currency sub-unit.
                          'name': userController.user.value.firstName,
                          // 'order_id':
                          //     'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                          'description': 'No description added',
                          'timeout': 300,
                          // in seconds
                          'prefill': {
                            'contact': userController.user.value.billing!.phone,
                            'email': userController.user.value.email
                          }
                        };

                        try {
                          orderController.createOrder(
                              userController.user.value.id.toString(),
                              userController.user.value,
                              cartListController.cartList,
                              "testestestest");
                          _razorpay.open(options);
                        } catch (e) {
                          print("ppppppppppppppppppppppppppppppppppppppppp");
                          debugPrint(e as String?);
                        }
                      } else {
                        print("empty cart");
                      }
                    },
                  )
                ],
              ));
        }),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Obx(() {
                if (cartListController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    // Container(
                    //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    //   width: double.infinity,
                    //   color: Colors.white,
                    //   child: CustomText(
                    //     // text: "Deliver to: " + "201301",
                    //     text: cartListController.totalAmount.toString(),
                    //     color: Colors.black
                    //   ),

                    // ),
                    const SizedBox(height: 10),
                    ListView.separated(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartListController.cartList.length,
                      itemBuilder: (BuildContext, index) {
                        return CartListTile(
                          cartData: cartListController.cartList[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    cartListController.cartList.isEmpty
                        ? const SizedBox()
                        : GetX<UserController>(builder: (sController) {
                            if (sController.isLoading.value) {
                              return const CircularProgressIndicator();
                            }
                            return Container(
                              color: Colors.white,
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // CustomText(
                                      //   text: "Billing Detail",
                                      //   fontSize: 18,
                                      //   fontweight: FontWeight.w600,
                                      // ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 22,
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(EditAddAddressScreen(
                                            appTitle: "Edit Billing Address",
                                            btName: "Update",
                                            type: "Bill",
                                            // userId: sController.user.value.id ?? 0,
                                            userDataM: sController.user.value,
                                          ));
                                        },
                                        child: Container(
                                            height: 20,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.redAccent),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(3),
                                                )),
                                            child: Center(
                                              child: CustomText(
                                                text: "Edit",
                                                fontSize: 12,
                                                fontweight: FontWeight.w400,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomText(
                                    text: sController
                                            .user.value.billing!.firstName
                                            .toString() +
                                        " " +
                                        sController.user.value.billing!.lastName
                                            .toString(),
                                    fontSize: 13,
                                    color: Colors.black45,
                                    fontweight: FontWeight.w500,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  CustomText(
                                    text: sController
                                            .user.value.billing!.address1
                                            .toString() +
                                        " " +
                                        sController.user.value.billing!.address2
                                            .toString() +
                                        " " +
                                        sController.user.value.billing!.city
                                            .toString(),
                                    fontSize: 13,
                                    color: Colors.black45,
                                    fontweight: FontWeight.w500,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  CustomText(
                                    text: sController
                                        .user.value.billing!.postcode
                                        .toString(),
                                    fontSize: 13,
                                    color: Colors.black45,
                                    fontweight: FontWeight.w500,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  CustomText(
                                    text: sController.user.value.billing!.state
                                        .toString(),
                                    fontSize: 13,
                                    color: Colors.black45,
                                    fontweight: FontWeight.w500,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  CustomText(
                                    text: "Mob No.:- " +
                                        sController.user.value.billing!.phone
                                            .toString(),
                                    fontSize: 13,
                                    color: Colors.black45,
                                    fontweight: FontWeight.w500,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  CustomText(
                                    text: "Email:- " +
                                        sController.user.value.billing!.email
                                            .toString(),
                                    fontSize: 13,
                                    color: Colors.black45,
                                    fontweight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            );
                          }),

                    const SizedBox(height: 8),

                    //  GetX<UserController>(
                    //    builder: (sController) {
                    //     if(sController.isLoading.value)
                    //       return CircularProgressIndicator();
                    //      return  Container(
                    //     color: Colors.white,
                    //     width: double.infinity,
                    //     padding: const EdgeInsets.all(8),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             CustomText(
                    //               text: "Shipping Detail",
                    //               fontSize: 18,
                    //               fontweight: FontWeight.w600,
                    //             ),
                    //             InkWell(
                    //           onTap: (){
                    //         // Get.to(OrderDetailScreen(orderModel: widget.orderListModel));
                    //                             },
                    //           child: Container(
                    //             height: 20,
                    //             width: 60,
                    //               decoration: BoxDecoration(
                    //                   color: Colors.white,
                    //                   border: Border.all(
                    //                       width: 1, color: Colors.redAccent),
                    //                   borderRadius: const BorderRadius.all(
                    //                     Radius.circular(3),
                    //                   )),
                    //               child: Center(
                    //                 child: CustomText(
                    //                   text: "Edit",
                    //                   fontSize: 12,
                    //                   fontweight: FontWeight.w400,
                    //                 ),
                    //               )),
                    //         ),
                    //           ],
                    //         ),
                    //         const SizedBox(
                    //           height: 5,
                    //         ),
                    //         CustomText(
                    //           text: sController.user.value.shipping!.firstName.toString() + " " + sController.user.value.shipping!.lastName.toString(),
                    //           fontSize: 13,
                    //           color: Colors.black45,
                    //           fontweight: FontWeight.w500,
                    //         ),
                    //         const SizedBox(
                    //           height: 2,
                    //         ),
                    //         CustomText(
                    //           text:sController.user.value.shipping!.address1.toString(),
                    //           fontSize: 13,
                    //           color: Colors.black45,
                    //           fontweight: FontWeight.w500,
                    //         ),
                    //         const SizedBox(
                    //           height: 2,
                    //         ),
                    //         CustomText(
                    //           text: sController.user.value.shipping!.address2.toString(),
                    //           fontSize: 13,
                    //           color: Colors.black45,
                    //           fontweight: FontWeight.w500,
                    //         ),
                    //         const SizedBox(
                    //           height: 2,
                    //         ),
                    //         CustomText(
                    //           text: sController.user.value.shipping!.city.toString()+ ", " + sController.user.value.shipping!.postcode.toString(),
                    //           fontSize: 13,
                    //           color: Colors.black45,
                    //           fontweight: FontWeight.w500,
                    //         ),
                    //         const SizedBox(
                    //           height: 2,
                    //         ),
                    //         CustomText(
                    //           text: sController.user.value.shipping!.state.toString(),
                    //           fontSize: 13,
                    //           color: Colors.black45,
                    //           fontweight: FontWeight.w500,
                    //         ),
                    //       ],
                    //     ),
                    //   );
                    //   }
                    //  ),
                  ],
                );
              })
              // child: Column(
              //   children: [
              //     Container(
              //       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              //       width: double.infinity,
              //       color: Colors.white,
              //       child: CustomText(
              //         text: "Deliver to: " + "201301",
              //         color: Colors.black
              //       ),
              //     ),
              //     SizedBox(height: 10),
              //     ListView.separated(
              //       physics: ScrollPhysics(),
              //     shrinkWrap: true,
              //       itemCount: 10,
              //       itemBuilder: (BuildContext, index) {
              //         return CartListTile();
              //       },
              //       separatorBuilder: (BuildContext context, int index) {
              //         return const SizedBox(
              //           height: 10,
              //         );
              //       },
              //     ),
              //     // const SizedBox(height: 10),
              //     // Row(
              //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //   children: [
              //     //     CustomText( text:"₹"+"3122.55", color: Colors.green, fontSize: 18,),
              //     //     InkWell(
              //     //       onTap: () {
              //     //                       // Get.to(TrackProduct());
              //     //       },
              //     //       child: CustomText(
              //     //         text: "View detail", color: Colors.blue, fontSize: 12, ),
              //     //       )
              //     //   ],
              //     // ),
              //     // const SizedBox(height: 10),
              //     // CustomButton(
              //     //   btname: "Proceed to Payment",
              //     //   onTap: (){
              //     //     // Get.to(EditAddAddressScreen(
              //     //     //   appTitle: "Add New Address",
              //     //     //   btName: "Add",
              //     //     //   )
              //     //     // );
              //     //   },
              //     // )
              //   ],
              // ),
              ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _razorpay.clear();
    super.dispose();
  }
}
