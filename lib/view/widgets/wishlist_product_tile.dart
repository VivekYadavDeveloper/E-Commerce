import 'package:flutter/material.dart';
import 'package:futkart/controller/wishlist_controller.dart';
import 'package:futkart/db/db_helper.dart';
import 'package:futkart/db/db_helper_model.dart';
import 'package:futkart/model/category_product_list_model.dart';
import 'package:futkart/view/product_detail_screen.dart';
import 'package:get/get.dart';

class WishlistProductTile extends StatefulWidget {
  DbHelperModel dataModel;
  WishlistProductTile({super.key, required this.dataModel});

  @override
  State<WishlistProductTile> createState() => _WishlistProductTileState();
}

class _WishlistProductTileState extends State<WishlistProductTile> {
  int? pid;

  @override
  void initState() {
    // TODO: implement initState
    var myInt = int.parse(widget.dataModel.product_id.toString());
    assert(myInt is int);
    pid = myInt;
    super.initState();
  }

  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailScreen(
          prodId: pid!,
        ));
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    // child: Image.asset(
                    //   'images/img_image7.png',
                    //   fit: BoxFit.fill,
                    // )
                    child: Image.network(
                      widget.dataModel.product_img_url.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        wishlistController.removeWhishlist(
                            widget.dataModel.product_id.toString());
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        // icon: product.isFavorite.value
                        //     ? Icon(Icons.favorite_rounded)
                        //     : Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.dataModel.product_name.toString(),
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
              // const SizedBox(height: 2),
              // Text(
              //   "SKU :- " + "kjbmn",
              //   maxLines: 1,
              //   style: TextStyle(fontSize: 10),
              //   overflow: TextOverflow.ellipsis,
              // ),
              // const SizedBox(height: 5),
              // Row(
              //   children: [
              //     const Text(
              //       "MEN",
              //       maxLines: 1,
              //       style: TextStyle(fontSize: 12),
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //     Container(
              //       margin: EdgeInsets.symmetric(horizontal: 4),
              //       height: 12,
              //       width: 1,
              //       color: Colors.black,
              //     ),
              //     const Text(
              //       "MOQ: " "4 Pairs",
              //       maxLines: 1,
              //       style: TextStyle(fontSize: 12),
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 12),
              Text(
                "₹ " + widget.dataModel.product_price.toString(),
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.blue),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
