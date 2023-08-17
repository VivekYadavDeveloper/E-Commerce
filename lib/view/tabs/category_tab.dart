import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:futkart/controller/product_list_controller.dart';
import 'package:futkart/view/search_product_screen.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/product_tile.dart';
import 'package:futkart/view/widgets/shimer_product_tile.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoryTab extends StatefulWidget {
  int prodCat;
  CategoryTab({super.key, required this.prodCat});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  final ProductListController productListController =
      Get.put(ProductListController());
  // final HomePageController subCategoryController =
  //     Get.put(HomePageController());
  ScrollController scrollController = ScrollController();

  // int? category = widget.prodCat;
  final _text = TextEditingController();

  int page = 1;
  int pageSize = 10;
  String strSearch = "";
  String tagName = "";
  String categoryId = "";
  String sortBy = "";
  String sortOrder = "asc";


  @override
  void initState() {
    // TODO: implement initState
    categoryId = widget.prodCat.toString();
    super.initState();
    productListController.filterProduct(
        page, pageSize, strSearch, tagName, categoryId, sortBy, sortOrder);

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          Get.find<ProductListController>().productList.length % 10 == 0) {
        page = page + 1;
        Get.find<ProductListController>().addItem(
            page,
            pageSize,
            strSearch,
            tagName,
            categoryId,
            sortBy,
            sortOrder);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return
        // SingleChildScrollView(
        // physics: ScrollPhysics(),
        // child: Column(
        // children: [
        // InkWell(
        //     onTap: (){
        //       // Get.to(HomeScreen(a: 1,));
        //     },
        //     child: Container(
        //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        //       height: 90,
        //       width: double.infinity,
        //       child: Image.asset(
        //             "images/womens-footwear-banner.jpg",
        //             fit: BoxFit.fill,
        //           )
        //     ),
        //   ),
        // AlignedGridView.count(
        // physics: ScrollPhysics(),
        // shrinkWrap: true,
        // itemCount: 15,
        // crossAxisCount: 2,
        // mainAxisSpacing: 5,
        // crossAxisSpacing: 5,
        // // axisDirection: AxisDirection.up,
        // itemBuilder: (BuildContext context, int index) {
        //    return const ProductTile();
        // },
        //   )
        Obx(() {
      if (productListController.isLoading.value)
        return AlignedGridView.count(
          itemCount: 8,
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          itemBuilder: (BuildContext context, int index) {
            return ShimerProductTile();
          },
        );
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            // color: Colors.grey[100],
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(width: 0.5, color: Colors.redAccent)
                    ),
                    child: TextButton(
                      onPressed: (){
                        Get.to(SerachProductScreen());
                      },
                      child: CustomText(
                            text: "Search Product",
                            color: Colors.redAccent,
                          ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(width: 0.5, color: Colors.redAccent)
                    ),
                    child: TextButton(
                        onPressed: () {
                          //////////////////////////////////////////////////////    filter bottom sheet
                          Get.bottomSheet(
                            SizedBox(
                              height: 260,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ////////////////////////////////////   popularity
                                    InkWell(
                                      onTap: () {
                                        page = 1;
                                        sortBy = "popularity";
                                        sortOrder = "asc";
                                        productListController.filterProduct(
                                            page,
                                            pageSize,
                                            strSearch,
                                            tagName,
                                            categoryId,
                                            sortBy,
                                            sortOrder);
                                        Get.back();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(35),
                                          color: Colors.grey[50],
                                        ),
                                        child: CustomText(
                                          text: "Popularity",
                                        ),
                                      ),
                                    ),
                                    ////////////////////////////////////   latest
                                    InkWell(
                                      onTap: () {
                                        page = 1;
                                        sortBy = "date";
                                        sortOrder = "desc";
                                        productListController.filterProduct(
                                            page,
                                            pageSize,
                                            strSearch,
                                            tagName,
                                            categoryId,
                                            sortBy,
                                            sortOrder);
                                        Get.back();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(35),
                                          color: Colors.grey[50],
                                        ),
                                        child: CustomText(
                                          text: "Latest",
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        page = 1;
                                        sortBy = "price";
                                        sortOrder = "asc";
                                        productListController.filterProduct(
                                            page,
                                            pageSize,
                                            strSearch,
                                            tagName,
                                            categoryId,
                                            sortBy,
                                            sortOrder);
                                        Get.back();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(35),
                                          color: Colors.grey[50],
                                        ),
                                        child: CustomText(
                                          text: "Price:-  low to high",
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        page = 1;
                                        sortBy = "price";
                                        sortOrder = "desc";
                                        productListController.filterProduct(
                                            page,
                                            pageSize,
                                            strSearch,
                                            tagName,
                                            categoryId,
                                            sortBy,
                                            sortOrder);
                                        Get.back();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(35),
                                          color: Colors.grey[50],
                                        ),
                                        child: CustomText(
                                          text: "Price:-  high to low",
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(35),
                                          color: Colors.grey[50],
                                        ),
                                        child: CustomText(
                                          text: "Most viewed",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ignoreSafeArea: false,
                            backgroundColor: Colors.white,
                            isDismissible: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              ),
                            ),
                            enableDrag: true,
                          );
                        },
                        child: CustomText(text: "Filter Product", color: Colors.redAccent,)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AlignedGridView.count(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              controller: scrollController,
              itemCount: Get.find<ProductListController>().isAddLoading.value
                  ? Get.find<ProductListController>().productList.length + 2
                  : Get.find<ProductListController>().productList.length,
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              itemBuilder: (BuildContext context, int index) {
                // return ProductTile(product: productListController.productList[index]);
                if (Get.find<ProductListController>().productList.length <=
                    index)
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.10),
                    highlightColor: Colors.white.withOpacity(0.06),
                    child: Container(
                      height: 200,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                    ),
                  );
                return ProductTile(
                    product: productListController.productList[index]);
              },
            ),
          )
        ],
      );
    });
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:futkart/controller/product_list_controller.dart';
// import 'package:futkart/view/widgets/product_tile.dart';
// import 'package:futkart/view/widgets/shimer_product_tile.dart';
// import 'package:get/get.dart';

// class CategoryTab extends StatefulWidget {
//   int prodCat;
//   CategoryTab({super.key, required this.prodCat});

//   @override
//   State<CategoryTab> createState() => _CategoryTabState();
// }

// class _CategoryTabState extends State<CategoryTab> {

//   final ProductListController productListController = Get.put(ProductListController());
//   ScrollController scrollController = ScrollController();
//   int page =1;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     productListController.fetchProduct(widget.prodCat);


//     scrollController.addListener(() {
//       if (scrollController.position.maxScrollExtent ==
//               scrollController.offset &&
//           Get.find<ProductListController>().productList.length % 10 == 0) {
//             page=page+1;
//         Get.find<ProductListController>()
//             .addItem(
//               widget.prodCat,
//               // Get.find<ProductListController>().productList.length
//               page
//           );
//         }
//       }
//     );


 
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//       // SingleChildScrollView(
//       //   physics: ScrollPhysics(),
//       //   child: Column(
//       //     children: [
//             // InkWell(
//             //     onTap: (){
//             //       // Get.to(HomeScreen(a: 1,));
//             //     },
//             //     child: Container(
//             //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
//             //       height: 90,
//             //       width: double.infinity,
//             //       child: Image.asset(
//             //             "images/womens-footwear-banner.jpg",
//             //             fit: BoxFit.fill,
//             //           )
//             //     ),
//             //   ),
//             // AlignedGridView.count(
//             //   physics: ScrollPhysics(),
//             //   shrinkWrap: true,
//             // itemCount: 15,
//             // crossAxisCount: 2,
//             // mainAxisSpacing: 5,
//             // crossAxisSpacing: 5,
//             // // axisDirection: AxisDirection.up,
//             // itemBuilder: (BuildContext context, int index) {
//             //    return const ProductTile();
//             // },
//             //   )
//             Obx(() {
//               if(productListController.isLoading.value)
//               // return Center(child: CircularProgressIndicator());
//               // return ShimerProductTile();
//               return AlignedGridView.count(

//               itemCount: 8,
//               crossAxisCount: 2,
//               mainAxisSpacing: 5,
//               crossAxisSpacing: 5,
//               itemBuilder: (BuildContext context, int index) {
//                 return ShimerProductTile();
//                },
//               );
//               return AlignedGridView.count(
//               shrinkWrap: true,
//               controller: scrollController,
//               itemCount: Get.find<ProductListController>().isAddLoading.value
//                     ? Get.find<ProductListController>().productList.length + 10
//                     : Get.find<ProductListController>().productList.length + 10,
//               crossAxisCount: 2,
//               mainAxisSpacing: 5,
//               crossAxisSpacing: 5,
//               itemBuilder: (BuildContext context, int index) {
//                   // return ProductTile(product: productListController.productList[index]);
//                   if (Get.find<ProductListController>().productList.length <= index)
//                   return Center(child: CircularProgressIndicator());
//                   // return SizedBox();
//                   return ProductTile(product: productListController.productList[index]);
//                },
//               );

//               //////////////////////////////////////////////////////////////////////////     first code
//               // return AlignedGridView.count(
//               // itemCount: productListController.productList.value.length,
//               // crossAxisCount: 2,
//               // mainAxisSpacing: 5,
//               // crossAxisSpacing: 5,
//               // shrinkWrap: true,
//               // controller: scrollController,
//               // itemBuilder: (BuildContext context, int index) {
//               //   // if(index > productListController.productList.value.length) {
//               //     return ProductTile(product: productListController.productList[index]);
//               //   // } else {
//               //   //   return Padding(
//               //   //     padding: EdgeInsets.all(8),
//               //   //     child: Center(child: CircularProgressIndicator())
//               //   //   );
//               //   // }
//               //   // return ProductTile(product: productListController.productList[index]);
//               //  },
//               // );
//             }
//             );
//   }
// }
