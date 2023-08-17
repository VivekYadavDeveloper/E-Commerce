import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futkart/view/order_detail_screen.dart';
import 'package:futkart/view/track_product.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../model/order_list_model.dart';

class OrderTile extends StatefulWidget {
  String? orderTyp;
  Color? oColor;
  OrderListModel? orderListModel;
  OrderTile({super.key, this.orderTyp, this.oColor, this.orderListModel});

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.2, color: Colors.black26),
            borderRadius: const BorderRadius.all(Radius.circular(3))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Order Id- " + widget.orderListModel!.id.toString(),
                    fontSize: 18,
                    // color: Colors.white,
                    fontweight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomText(
                    text: "Date- " +
                        widget.orderListModel!.dateCreated.toString(),
                    fontSize: 12,
                    color: Colors.black38,
                    fontweight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "₹ " + widget.orderListModel!.total.toString(),
                        fontSize: 20,
                        color: Colors.blue,
                        fontweight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.orderListModel!.lineItems.length,
                      itemBuilder: (buidcontext, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.black38)),
                              // child: Image.network(
                              //     widget.orderListModel!.lineItems[index].image.src,
                              //     fit: BoxFit.fill,
                              //     height: 80,
                              //     width: 80,
                              // ),
                              child: CachedNetworkImage(
                                imageUrl: widget
                                    .orderListModel!.lineItems[index].image.src,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(height: 2),
                            CustomText(
                              text: widget.orderListModel!.lineItems[index].sku
                                  .toString(),
                              fontSize: 8,
                              color: Colors.black38,
                              fontweight: FontWeight.w500,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 2);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ///////////////////////////////////////////////////////////  buttons
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Get.to(OrderDetailScreen(
                                orderModel: widget.orderListModel));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1, color: Colors.redAccent),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(3),
                                  )),
                              child: Center(
                                child: CustomText(
                                  text: "Order Detail",
                                  fontweight: FontWeight.w400,
                                ),
                              )),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        /////////////////////////////////////////////    track order button
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            // Get.to( TrackProduct());
                          },
                          child: Container(
                              // decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     border: Border.all(
                              //         width: 1, color: Colors.redAccent),
                              //     borderRadius: const BorderRadius.all(
                              //       Radius.circular(3),
                              //     )),
                              // child: Center(
                              //   child: CustomText(
                              //     text: "Track order",
                              //   ),
                              // )
                              ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
