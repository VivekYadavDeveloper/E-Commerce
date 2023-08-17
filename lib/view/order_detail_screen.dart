import 'package:flutter/material.dart';
import 'package:futkart/controller/order_list_controller.dart';
import 'package:futkart/model/order_list_model.dart';
import 'package:futkart/view/payment_detail_screen.dart';
import 'package:futkart/view/track_product.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:get/get.dart';

class OrderDetailScreen extends StatefulWidget {
  OrderListModel? orderModel;
  OrderDetailScreen({super.key, this.orderModel});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {

  final OrderListController orderController = Get.put(OrderListController());
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0,
          title: CustomText(
            text: "Order Id :- " + widget.orderModel!.id.toString(),
            color: Colors.white,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   color: Colors.red,
              //   padding: EdgeInsets.all(8),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       CustomText(text: "Cancelled by you"),
              //       const Icon(
              //         Icons.info_outlined,
              //         color: Colors.white,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Total Ammount:- ",
                          fontSize: 18,
                          fontweight: FontWeight.w600,
                        ),
                        CustomText(
                          text: "₹" + widget.orderModel!.total.toString(),
                          fontSize: 18,
                          color: Colors.blue,
                          fontweight: FontWeight.w500,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: "Payment Mode :- " +
                          widget.orderModel!.paymentMethodTitle.toString(),
                      fontSize: 14,
                      fontweight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: "transaction Id :- " +
                          widget.orderModel!.transactionId.toString(),
                      fontSize: 14,
                      fontweight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: "Order date :- " +
                          widget.orderModel!.dateCreated.toString(),
                      fontSize: 14,
                      fontweight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     // Get.to(TrackProduct());
                    //   },
                    //   child: Container(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 10, vertical: 10),
                    //       // width: 100,
                    //       decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           border:
                    //               Border.all(width: 1, color: Colors.redAccent),
                    //           borderRadius: const BorderRadius.all(
                    //             Radius.circular(3),
                    //           )),
                    //       child: Center(
                    //         child: CustomText(
                    //           text: "Cancle Order",
                    //           fontweight: FontWeight.w400,
                    //         ),
                    //       )),
                    // ),
                  ],
                ),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const SizedBox(height: 15),
              //     CustomText(
              //       text: "Bill Detail",
              //       fontSize: 18,
              //       fontweight: FontWeight.w400,
              //     ),
              //     Divider(
              //       thickness: 1,
              //     ),
              //     SizedBox(height: 5),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         CustomText(
              //           text: "Sub Total",
              //           fontSize: 15,
              //           // fontweight: ,
              //         ),
              //         CustomText(
              //           text: "₹" + "1539",
              //           fontSize: 15,
              //           // fontweight: ,
              //         ),
              //       ],
              //     ),
              //     const SizedBox(height: 5),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         CustomText(
              //           text: "Seller Discount",
              //           fontSize: 15,
              //           // fontweight: ,
              //         ),
              //         CustomText(
              //           text: "(-)" + "31",
              //           fontSize: 15,
              //           // fontweight: ,
              //         ),
              //       ],
              //     ),
              //     const SizedBox(height: 5),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         CustomText(
              //           text: "GST",
              //           fontSize: 15,
              //           // fontweight: ,
              //         ),
              //         CustomText(
              //           text: "(+)" + "180.99",
              //           fontSize: 15,
              //           // fontweight: ,
              //         ),
              //       ],
              //     ),
              //     const SizedBox(height: 5),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         CustomText(
              //             text: "Total Ammount",
              //             fontSize: 15,
              //             // fontweight: ,
              //             color: Colors.blue),
              //         CustomText(
              //             text: "₹" + "1689.24",
              //             fontSize: 15,
              //             color: Colors.blue
              //             // fontweight: ,
              //             ),
              //       ],
              //     ),
              //     const SizedBox(height: 10),
              //     CustomText(
              //       text: "Net Payble Ammount",
              //       fontSize: 18,
              //       fontweight: FontWeight.w400,
              //       // color: Colors.blue
              //     ),
              //     const Divider(
              //       thickness: 1,
              //     ),
              //     const SizedBox(height: 5),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         CustomText(
              //           text: "Cash on Delivery",
              //           fontSize: 15,
              //           // fontweight: ,
              //           // color: Colors.blue
              //         ),
              //         CustomText(
              //             text: "₹" + "1689.24",
              //             fontSize: 15,
              //             color: Colors.green
              //             // fontweight: ,
              //             ),
              //       ],
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // InkWell(
              //   onTap: () {
              //     Get.to(const PaymentDetailScreen());
              //   },
              //   child: Container(
              //       color: Colors.white,
              //       padding:
              //           const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           CustomText(
              //             text: "View Payment Summary",
              //             fontSize: 18,
              //             fontweight: FontWeight.w600,
              //             color: Colors.orange[300],
              //           ),
              //           Icon(
              //             Icons.arrow_circle_right_outlined,
              //             color: Colors.orange[300],
              //           )
              //         ],
              //       )),
              // ),
              const SizedBox(
                height: 8,
              ),
              ////////////////////////////////////////////////////////////////////////    ordered product list
              ListView.separated(
                itemCount: widget.orderModel!.lineItems.length,
                // scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (buildcontext, index) {
                  return Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 100,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black26),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(3))),
                                child: Image.network(
                                  widget.orderModel!.lineItems[index].image.src,
                                  fit: BoxFit.fill,
                                )),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: widget
                                        .orderModel!.lineItems[index].name
                                        .toString(),
                                    maxLines: 1,
                                    fontSize: 16,
                                    fontweight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  CustomText(
                                    text: "₹ " +
                                        widget
                                            .orderModel!.lineItems[index].total
                                            .toString(),
                                    fontSize: 16,
                                    fontweight: FontWeight.w400,
                                    color: Colors.blue,
                                  ),
                                  // CustomText(
                                  //   text: "Navy Blue",
                                  //   fontSize: 14,
                                  //   fontweight: FontWeight.w400,
                                  // ),
                                  const SizedBox(height: 5),
                                  CustomText(
                                    text: "NOC :- " +
                                        widget.orderModel!.lineItems[index]
                                            .quantity
                                            .toString(),
                                    fontSize: 14,
                                    fontweight: FontWeight.w400,
                                  ),
                                  const SizedBox(height: 5),
                                  CustomText(
                                    text: "Size: " + "7/1,8/1,9/1,10/1",
                                    fontSize: 14,
                                    fontweight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 5);
                },
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: 15),
                    CustomText(
                      text: "Order Detail",
                      fontSize: 18,
                      fontweight: FontWeight.w600,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 5),
                    ListView.separated(
                      itemCount: widget.orderModel!.lineItems.length,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Product " + (index + 1).toString(),
                              fontSize: 15,
                              // fontweight: ,
                            ),
                            CustomText(
                              text: "₹ " + widget.orderModel!.lineItems[index].subtotal,
                              fontSize: 15,
                              // fontweight: ,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 7);
                      },
                    ),
                    // const SizedBox(height: 7),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     CustomText(
                    //       text: "Sub Total",
                    //       fontSize: 15,
                    //       // fontweight: ,
                    //     ),
                    //     CustomText(
                    //       // text: "₹ "+ (int.parse(widget.orderModel!.total) - int.parse(widget.orderModel!.totalTax)).toString(),
                    //       text: "knjkg",
                    //       fontSize: 15,
                    //       // fontweight: ,
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 5),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     CustomText(
                    //       text: "Seller Discount",
                    //       fontSize: 15,
                    //       // fontweight: ,
                    //     ),
                    //     CustomText(
                    //       text: "(-)" + "31",
                    //       fontSize: 15,
                    //       // fontweight: ,
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "GST",
                          fontSize: 15,
                          // fontweight: ,
                        ),
                        CustomText(
                          text: "(+)" + widget.orderModel!.totalTax,
                          fontSize: 15,
                          // fontweight: ,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: "Total Ammount",
                            fontSize: 15,
                            // fontweight: ,
                            color: Colors.blue),
                        CustomText(
                            text: "₹" + widget.orderModel!.total,
                            fontSize: 15,
                            color: Colors.blue
                            // fontweight: ,
                            ),
                      ],
                    ),
                    // const SizedBox(height: 10),
                    // CustomText(
                    //   text: "Net Payble Ammount",
                    //   fontSize: 18,
                    //   fontweight: FontWeight.w400,
                    //   // color: Colors.blue
                    // ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Net Payble Ammount",
                          fontSize: 15,
                          // fontweight: ,
                          // color: Colors.blue
                        ),
                        CustomText(
                            text: "₹" + widget.orderModel!.total,
                            fontSize: 15,
                            color: Colors.green
                            // fontweight: ,
                            ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              /////////////////////////////////////////////////////////////     billing detail
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Billing Detail",
                      fontSize: 18,
                      fontweight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.firstName.toString() +
                          " " +
                          widget.orderModel!.billing.lastName.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.address1.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.address2.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.city.toString() +
                          " " +
                          widget.orderModel!.billing.postcode.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.state.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: "Mob No.:- " +
                          widget.orderModel!.billing.phone.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: "Email:- " +
                          widget.orderModel!.billing.email.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Shipping Detail",
                      fontSize: 18,
                      fontweight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.firstName.toString() +
                          " " +
                          widget.orderModel!.billing.lastName.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.address1.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.address2.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.city.toString() +
                          " " +
                          widget.orderModel!.billing.postcode.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: widget.orderModel!.billing.state.toString(),
                      fontSize: 13,
                      color: Colors.black45,
                      fontweight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              (widget.orderModel!.status == "processing" || widget.orderModel!.status == "onhold") ? 
              InkWell(
                      onTap: () {
                        Get.defaultDialog(
                      title: "Cancle Order",
                      content: Column(
                        children: [
                          CustomText(text: "Are you sure you want to cancle the order?"),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  // setState(() {
                                  //   loading=true;
                                  // });
                                   orderController.cancleOrder(widget.orderModel!.id.toString(), "cancelled");
                                  //  .then((a){
                                  //   return true;
                                  //  });
                                  // setState(() {
                                  //   loading=false;
                                  // });
                                  Get.back();
                                  // Get.back();
                                }, 
                                child: Text("Confirm")
                              ),
                              TextButton(
                                onPressed: (){
                                  Get.back();
                                }, 
                                child: Text("Cancle")
                              )
                            ],
                          )
                        ],
                      ));
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          // width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(width: 1, color: Colors.redAccent),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(3),
                              )),
                          child: Center(
                            child: CustomText(
                              text: "Cancle Order",
                              fontweight: FontWeight.w400,
                              color: Colors.redAccent,
                            ),
                          )),
                    ) 
                    : SizedBox(),
                    const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
