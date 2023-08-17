import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:futkart/controller/wishlist_controller.dart';
import 'package:futkart/view/widgets/cart_list_tile.dart';
import 'package:futkart/view/widgets/custom_buttton.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/shimer_product_tile.dart';
import 'package:futkart/view/widgets/wishlist_product_tile.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> { 

  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  void initState() {
    // TODO: implement initState
    wishlistController.getWhishlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            elevation: 0,
            title: CustomText(
              text: "Wishlist",
              color: Colors.white,
            )),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Obx(() {
            if (wishlistController.isLoading.value)
            return const Center(child: CircularProgressIndicator());
            return  AlignedGridView.count(
              itemCount: wishlistController.wishList.length,
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              itemBuilder: (BuildContext context, int index) { 
                return WishlistProductTile(dataModel: wishlistController.wishList[index]);
               },
              );
          })
          
        ));
  }
}