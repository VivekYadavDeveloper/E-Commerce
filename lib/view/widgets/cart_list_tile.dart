import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futkart/controller/cart_controller.dart';
import 'package:futkart/db/cart_db_model.dart';
import 'package:futkart/model/cart_model.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:get/get.dart';

class CartListTile extends StatefulWidget {
  CartDBModel? cartData;
  // CartModel? cartData;
  CartListTile({super.key, required this.cartData});

  @override
  State<CartListTile> createState() => _CartListTileState();
}

class _CartListTileState extends State<CartListTile> {

  final CartController cartController = Get.put(CartController());

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 105,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(width: 1, color: Colors.black26),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3))),
                          // child: Image.network(
                          //   widget.cartData!.product_img_url.toString(),
                          //   fit: BoxFit.fill,
                          // )
                          child: CachedNetworkImage(
                      imageUrl: widget.cartData!.product_img_url.toString(),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartData!.product_name.toString(),
                              maxLines: 1,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
                              overflow: TextOverflow.ellipsis,
                              
                            ),
                            // const SizedBox(height: 2),
                            // const Text(
                            //   "Synthetic foals and loafers foals and loafers ",
                            //   maxLines: 1,
                            //   style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,color: Colors.black38,),
                            //   overflow: TextOverflow.ellipsis,
                              
                            // ),
                            const SizedBox(height: 5),
                            CustomText(
                              text: "Size:- " + "6/1,7/1,8/1,9/1",
                              fontSize: 13,
                              color: Colors.black38,
                              fontweight: FontWeight.w500,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                CustomText(
                                  text: "Quantity:- " + widget.cartData!.quantity.toString(),
                                  fontSize: 13,
                                  color: Colors.black38,
                                  fontweight: FontWeight.w500,
                                ),
                                
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // InkWell(
                                //   onTap: () {
                                //     Get.to(TrackProduct());
                                //   },
                                //   child: CustomText(
                                //       text: "Edit", color: Colors.indigo, fontSize: 12,),
                                // ),
                                InkWell(
                                  onTap: () {
                                    // Get.to(TrackProduct());
                                    cartController.removeCart(
                                    widget.cartData!.product_id.toString());
                                  },
                                  child: CustomText(
                                      text: "Remove", color: Colors.indigo, fontSize: 12
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      );
  }
}
