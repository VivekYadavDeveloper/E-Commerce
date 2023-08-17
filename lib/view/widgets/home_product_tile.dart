import 'package:flutter/material.dart';
import 'package:futkart/controller/wishlist_controller.dart';
import 'package:futkart/db/db_helper.dart';
import 'package:futkart/model/category_product_list_model.dart';
import 'package:futkart/view/product_detail_screen.dart';
import 'package:futkart/view/widgets/product_tile.dart';
import 'package:get/get.dart';

class HomePageProductTile extends StatefulWidget {
  HomePageProductTile({super.key, required this.product});

  CategoryProductListModel? product;

  @override
  State<HomePageProductTile> createState() => _HomePageProductTileState();
}

class _HomePageProductTileState extends State<HomePageProductTile> {

  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailScreen(
          prodId: widget.product!.id,
        ));
      },
      child: Container(
        height: 400,
        width: 150,
        // elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
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
                      widget.product!.images[0].medium.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                    //  Positioned(
                    //   right: 0,
                    //   child: GestureDetector(
                    //     onTap: ()  {
                    //       wishlistController.addToWhishlist(
                    //         widget.product!.id.toString(),
                    //         widget.product!.name.toString(),
                    //         "48",
                    //         widget.product!.price.toString(),
                    //         widget.product!.images[0].src.toString()
                    //       );

                          // DbHelper.dbhelper.insertData({
                          //   DbHelper.columnId: "45639",
                          //   DbHelper.columnPName: "shivam"
                          // }).then((value) {
                          //   print("data added");
                          // }).onErorr((error, stackTrace) {
                          //   print(error.toString());
                          // });
                          // var contain = wishlistController.wishList.where((element) => element.id == "45638");
                          // if (contain.isEmpty){
                          //   a = true;
                          // } else {
                          //   a = false;
                          // }
                      //     productListController.productList
                      // .where((element) => element.parent == 0)
                      // .toList()[index]
                      // .image
                      // .src
                      // .toString(),
                        // },
                        // child: CircleAvatar(
                        //   backgroundColor: Colors.white,
                        //   child: Icon(Icons.favorite_border
                            
                        //   ),
                        //   // icon: product.isFavorite.value
                        //   //     ? Icon(Icons.favorite_rounded)
                        //   //     : Icon(Icons.favorite_border),
                        // ),
                      // ),
                  // ),
                  // Positioned(
                  //     left: 0,
                  //     bottom: 0,
                  //     child: Container(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 5, vertical: 2),
                  //       decoration: BoxDecoration(
                  //           color: Colors.redAccent.withOpacity(0.6),
                  //           borderRadius:
                  //               const BorderRadius.all(Radius.circular(50)),
                  //           border:
                  //               Border.all(width: 1, color: Colors.redAccent)),
                  //       child: const Text(
                  //         "New Arrival",
                  //         maxLines: 2,
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white,
                  //             fontSize: 12),
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     )),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.product!.name.toString(),
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
              // const SizedBox(height: 2),
              Text(
                "SKU :- " + widget.product!.sku.toString(),
                maxLines: 1,
                style: TextStyle(fontSize: 10),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  // const Text(
                  //   "MEN",
                  //   maxLines: 1,
                  //   style: TextStyle(fontSize: 12),
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 4),
                  //   height: 12,
                  //   width: 1,
                  //   color: Colors.black,
                  // ),
                  const Text(
                    "1C: " "48 Pairs",
                    maxLines: 1,
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "₹ ${widget.product!.price}",
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
