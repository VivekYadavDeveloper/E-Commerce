import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:futkart/controller/home_page_controller.dart';
import 'package:futkart/controller/product_list_controller.dart';
import 'package:futkart/controller/tab_controller.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:futkart/view/widgets/home_product_tile.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  TabCController? tab;
  HomeTab({super.key, this.tab});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> imagePath = [
    "images/670 - 240 men.jpg",
    "images/womens-footwear-banner.jpg",
    "images/kids footwear shoes.jpg"
  ];

  final HomePageController productListController =
      Get.put(HomePageController());
  final ProductListController recentProducts = Get.put(ProductListController());

  CarouselSliderController? _sliderController;
  @override
  void initState() {
    // recentProducts.fetchRecentProduct(
    //   1, 10, "", "", "172", "", "asc"
    // );
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Obx(() {
        if (productListController.isLoading.value)
        return Center(child: CircularProgressIndicator());
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: ListView.separated(
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                      itemCount: productListController.productList
                  .where((element) => element.parent == 0)
                  .toList()
                  .length,
                  itemBuilder: (buidcontext, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            widget.tab?.updatePage(
                              1,
                              productListController.productList
                              .where((element) => element.parent == 0)
                              .toList()[index]
                              .id
                            );
                            print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                            print(productListController.productList
                              .where((element) => element.parent == 0)
                              .toList()[index]
                              .id);
                          },
                          child: CircleAvatar(
                            radius: 44,
                            backgroundColor: mainColor,
                            child: CircleAvatar(
                              radius: 42,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: NetworkImage(
                                    // productListController.productList[index].image.src.toString(),
                                    productListController.productList
                                        .where((element) => element.parent == 0)
                                        .toList()[index]
                                        .image
                                        .src
                                        .toString(),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomText(
                          // text: productListController.productList[index].id.toString(),
                          text: productListController.productList
                                        .where((element) => element.parent == 0)
                                        .toList()[index]
                                        .name
                                        .toString(),
                          fontSize: 12,
                          color: Colors.black,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 6);
                  },
                ),
              ),
              SizedBox(
                height: 140,
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  controller: _sliderController,
                  slideBuilder: (index) {
                    return Image.asset(
                      imagePath[index].toString(),
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: imagePath.length,
                  initialPage: 0,
                  enableAutoSlider: true,
                ),
              ),
              const SizedBox(height: 15),
              AlignedGridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: productListController.productList
                    .where((element) => element.parent == 134 /*&& element.parent == 183 && element.parent == 134 && element.parent == 208*/)
                    .toList()
                    .length,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // widget.tab?.pindex.value = 1;
                      widget.tab?.updatePage(
                          1,
                          productListController.productList
                              .where((element) => element.parent == 134/* && element.parent == 183 && element.parent == 134 && element.parent == 208*/)
                              .toList()[index]
                              .id);
                    },
                    child: Container(
                        height: 150,
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: Image.network(
                          // productListController.productList[index].image.src.toString(),
                          productListController.productList
                              .where((element) => element.parent == 134/* && element.parent == 183 && element.parent == 134 && element.parent == 208*/)
                              .toList()[index]
                              .image
                              .src
                              .toString(),
                          fit: BoxFit.fill,
                        )),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: Image.asset("images/kids-footwear-shoes.jpg",
                      fit: BoxFit.fill)),
              const SizedBox(height: 30),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: CustomText(
              //     text: "Recent Viewd",
              //     color: Colors.black,
              //     fontSize: 20,
              //     fontweight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(height: 15),
              // SizedBox(
              //   height: 320,
              //   width: double.infinity,
              //   child: ListView.separated(
              //     // physics: NeverScrollableScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //     shrinkWrap: true,
              //     itemCount: recentProducts.productList.length,
              //     itemBuilder: (buidcontext, index) {
              //       return HomePageProductTile(
              //           product: recentProducts.recentProductList[index]);
              //     },
              //     separatorBuilder: (BuildContext context, int index) {
              //       return const SizedBox(width: 6);
              //     },
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }
}
