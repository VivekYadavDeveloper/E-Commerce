import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:futkart/controller/cart_controller.dart';
import 'package:futkart/controller/cart_controller_main.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:futkart/view/image_detail_screen.dart';
import 'package:futkart/view/tabs/cart_screen.dart';
import 'package:futkart/view/widgets/custom_text.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../controller/product_deatil_controller.dart';
import '../services/cart_added_function.dart';
import 'widgets/custom_textfeild.dart';

class ProductDetailScreen extends StatefulWidget {
  int prodId;

  ProductDetailScreen({super.key, required this.prodId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  CarouselSliderController? _sliderController;

  final ProductDetailController prodController =
      Get.put(ProductDetailController());
  final CartMainController abc = Get.put(CartMainController());
  final CartController cartController = Get.put(CartController());
  LocalFun obj = LocalFun();
  bool cartstatus = false;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
    obj.ceckStatus(widget.prodId.toString()).then((value) {
      cartstatus = value;
    });
    prodController.fetchSingleProduct(widget.prodId);
  }

  int count = 1;

  void Add() {
    count = count + 1;
    setState(() {});
  }

  void Minus() {
    if (count > 1) {
      count = count - 1;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: CustomText(
            text: "Product Details",
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(const CartScreen());
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Obx(() {
          if (prodController.isLoading.value)
            return const Center(child: CircularProgressIndicator());
          return Column(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /////////////////////////////////////////////////////////   product image
                      Stack(
                        children: [
                          SizedBox(
                            height: 300,
                            child: CarouselSlider.builder(
                              unlimitedMode: true,
                              controller: _sliderController,
                              slideBuilder: (index) {
                                // return Image.network(
                                //   prodController.aproduct.value.images![index].src.toString(),
                                //   fit: BoxFit.contain,
                                // );
                                return CachedNetworkImage(
                                  imageUrl: prodController
                                      .aproduct.value.images![index].src
                                      .toString(),
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                );
                              },
                              slideIndicator: CircularSlideIndicator(
                                indicatorRadius: 5,
                                padding: const EdgeInsets.only(bottom: 10),
                                // indicatorBorderColor: Colors.black,
                              ),
                              itemCount:
                                  prodController.aproduct.value.images!.length,
                              initialPage: 0,
                              enableAutoSlider: false,
                            ),
                          ),
                          Positioned(
                              right: 20,
                              top: 20,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.6),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    border: Border.all(
                                        width: 1, color: Colors.redAccent)),
                                child: const Text(
                                  "New Arrival",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      /////////////////////////////////////////////////////////////////   product name
                      CustomText(
                        text: prodController.aproduct.value.name.toString(),
                        fontweight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: "SKU:  " +
                            prodController.aproduct.value.sku.toString(),
                        fontweight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          // const Text(
                          //   "MEN",
                          //   // maxLines: 1,
                          //   style: TextStyle(fontSize: 14, color: Colors.black54),
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                          // Container(
                          //     margin: const EdgeInsets.symmetric(horizontal: 4),
                          //     height: 12,
                          //     width: 1,
                          //     color: Colors.black54),
                          Text(
                            "1 C: " + "48 Pairs",
                            // maxLines: 1,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "₹ " +
                                prodController.aproduct.value.price.toString(),
                            fontweight: FontWeight.w500,
                            color: Colors.blue,
                            fontSize: 25,
                          ),
                          // Container(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 5, vertical: 2),
                          //   decoration: BoxDecoration(
                          //       borderRadius:
                          //           const BorderRadius.all(Radius.circular(50)),
                          //       border: Border.all(
                          //           width: 1, color: Colors.orangeAccent)),
                          //   child: const Text(
                          //     "View price breakup",
                          //     maxLines: 2,
                          //     style: TextStyle(
                          //         color: Colors.orangeAccent, fontSize: 12),
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // )
                        ],
                      ),
                      const SizedBox(height: 20),
                      ///////////////////////////////////////////////////////////////////////////   size
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Size",
                            fontweight: FontWeight.w400,
                            // color: Colors.blue,
                            fontSize: 18,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(SizeChartScreen(
                                appbarTitle: "Sized Chart",
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  border: Border.all(
                                      width: 1, color: Colors.orangeAccent)),
                              child: const Text(
                                "Size Chart",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.orangeAccent, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        text: "6/1,7/1,8/1,9/1",
                        // fontweight: FontWeight.w500,
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                      ///////////////////////////////////////////////////////////////////////   Product Color
                      // const Divider(
                      //   height: 25,
                      //   thickness: 1,
                      // ),
                      // CustomText(
                      //   text: "Colors",
                      //   fontweight: FontWeight.w400,
                      //   // color: Colors.blue,
                      //   fontSize: 18,
                      // ),
                      // const SizedBox(height: 10),
                      // SizedBox(
                      //   height: 40,
                      //   child: ListView.separated(
                      //     // physics: NeverScrollableScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     shrinkWrap: true,
                      //     itemCount: 4,
                      //     itemBuilder: (buidcontext, index) {
                      //       return InkWell(
                      //         onTap: () {},
                      //         child: const CircleAvatar(
                      //           radius: 12,
                      //           backgroundColor: Colors.brown,
                      //         ),
                      //       );
                      //     },
                      //     separatorBuilder: (BuildContext context, int index) {
                      //       return const SizedBox(width: 6);
                      //     },
                      //   ),
                      // ),
                      ///////////////////////////////////////////////////////////////////////   Product quantity
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      CustomText(
                        text: "Quantity",
                        fontweight: FontWeight.w400,
                        // color: Colors.blue,
                        fontSize: 18,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    // border: Border.all(width: 1, color: mainColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(3),
                                    )),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Add();
                                      },
                                      child: const Center(
                                          // width: 20,
                                          child: Icon(
                                        Icons.add_circle_outline_sharp,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                        height: 20,
                                        width: 2,
                                        color: Colors.white),
                                    const SizedBox(width: 5),
                                    Expanded(
                                        child: Center(
                                            child: CustomText(
                                                text: count.toString(),
                                                fontSize: 18,
                                                fontweight: FontWeight.bold,
                                                color: Colors.white))),
                                    const SizedBox(width: 5),
                                    Container(
                                        height: 20,
                                        width: 2,
                                        color: Colors.white),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      onTap: () {
                                        Minus();
                                      },
                                      child: const Center(
                                          // width: 20,
                                          child: Icon(
                                              Icons.do_disturb_on_outlined,
                                              color: Colors.white,
                                              size: 20)),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   cartstatus = true;
                              // });
                              if (cartstatus = true) {
                                cartController.addToCart(
                                    prodController.aproduct.value.id.toString(),
                                    prodController.aproduct.value.name
                                        .toString(),
                                    "48",
                                    count.toString(),
                                    prodController.aproduct.value.price
                                        .toString(),
                                    prodController
                                        .aproduct.value.images![0].medium
                                        .toString());
                                obj
                                    .ceckStatus(prodController.aproduct.value.id
                                        .toString())
                                    .then((value) {
                                  setState(() {
                                    cartstatus = value;
                                  });
                                });
                              }

                              //   cartController.addToCart(
                              //     prodController.aproduct.value.id.toString(),
                              //     prodController.aproduct.value.name.toString(),
                              //     "48",
                              //     count.toString(),
                              //     prodController.aproduct.value.price.toString(),
                              //     prodController.aproduct.value.images![0].medium.toString()
                              // );
                              // obj.ceckStatus(prodController.aproduct.value.id.toString()).then((value) {

                              //   setState(() {
                              //     cartstatus =value;
                              //   });
                              // });
                            },
                            child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    // color: Colors.white,
                                    color: mainColor,
                                    border: Border.all(
                                      width: 1,
                                      // color: mainColor
                                      color: Colors.white,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(3),
                                    )),
                                child: Center(
                                    child: CustomText(
                                  text: cartstatus ? "Added" : "Add To Cart",
                                  // color: mainColor,
                                  fontweight: FontWeight.bold,
                                  color: Colors.white,
                                ))),
                          ),
                        ],
                      ),
                      //////////////////////////////////////////////////////////////////  Product Description
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      CustomText(
                        text: "Product Description",
                        fontweight: FontWeight.w400,
                        // color: Colors.blue,
                        fontSize: 18,
                      ),
                      const SizedBox(height: 10),
                      Html(
                        data: prodController.aproduct.value.description,
                        tagsList: Html.tags..addAll(["bird", "flutter"]),
                        style: {
                          "table": Style(
                            backgroundColor:
                                const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                          "tr": Style(
                            border: const Border(
                                bottom: BorderSide(color: Colors.grey)),
                          ),
                          "th": Style(
                            padding: const EdgeInsets.all(6),
                            backgroundColor: Colors.grey,
                          ),
                          "td": Style(
                            padding: const EdgeInsets.all(6),
                            alignment: Alignment.topLeft,
                          ),
                          'h5': Style(
                              maxLines: 2, textOverflow: TextOverflow.ellipsis),
                        },
                        customRender: {
                          "table": (context, child) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: (context.tree as TableLayoutElement)
                                  .toWidget(context),
                            );
                          },
                          // "bird": (RenderContext context, Widget child) {
                          //   return TextSpan(text: "🐦");
                          // },
                          "flutter": (RenderContext context, Widget child) {
                            return FlutterLogo(
                              style: (context.tree.element!
                                          .attributes['horizontal'] !=
                                      null)
                                  ? FlutterLogoStyle.horizontal
                                  : FlutterLogoStyle.markOnly,
                              textColor: context.style.color!,
                              size: context.style.fontSize!.size! * 5,
                            );
                          },
                        },
                        customImageRenders: {
                          networkSourceMatcher(domains: ["flutter.dev"]):
                              (context, attributes, element) {
                            return const FlutterLogo(size: 36);
                          },
                          networkSourceMatcher(domains: ["mydomain.com"]):
                              networkImageRender(
                            headers: {"Custom-Header": "some-value"},
                            altWidget: (alt) => Text(alt ?? ""),
                            loadingWidget: () => const Text("Loading..."),
                          ),
                          // On relative paths starting with /wiki, prefix with a base url
                          (attr, _) =>
                                  attr["src"] != null &&
                                  attr["src"]!.startsWith("/wiki"):
                              networkImageRender(
                                  mapUrl: (url) =>
                                      "https://upload.wikimedia.org" + url!),
                          // Custom placeholder image for broken links
                          networkSourceMatcher(): networkImageRender(
                              altWidget: (_) => const FlutterLogo()),
                        },
                        onLinkTap: (url, _, __, ___) {
                          print("Opening $url...");
                        },
                        onImageTap: (src, _, __, ___) {
                          print(src);
                        },
                        onImageError: (exception, stackTrace) {
                          print(exception);
                        },
                        onCssParseError: (css, messages) {
                          print("css that errored: $css");
                          print("error messages:");
                          messages.forEach((element) {
                            print(element);
                          });
                        },
                      ),
                      //////////////////////////////////////////////////////////////////  Product specification Table
                      // const Divider(
                      //   height: 25,
                      //   thickness: 1,
                      // ),
                      // CustomText(
                      //   text: "Product Specification",
                      //   fontweight: FontWeight.w400,
                      //   // color: Colors.blue,
                      //   fontSize: 18,
                      // ),
                      // const SizedBox(height: 10),
                      // Table(
                      //   border: TableBorder.all(color: Colors.black54),
                      //   children: List<TableRow>.generate(
                      //     _personList.length,
                      //     (index) {
                      //       final person = _personList[index];
                      //       return TableRow(
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.all(5.0),
                      //             child: CustomText(
                      //               text: 'Sole',
                      //               color: Colors.black54,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.all(5.0),
                      //             child: CustomText(
                      //               text: 'Sole',
                      //               color: Colors.black54,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.all(5.0),
                      //             child: CustomText(
                      //               text: 'Sole',
                      //               color: Colors.black54,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.all(5.0),
                      //             child: CustomText(
                      //               text: 'Sole',
                      //               color: Colors.black54,
                      //             ),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //     growable: false,
                      //   ),
                      // ),
                      /////////////////////////////////////////////////////////////////////////////////    return policy
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Return Policy",
                            fontweight: FontWeight.w400,
                            // color: Colors.blue,
                            fontSize: 18,
                          ),
                          InkWell(
                            onTap: () {
                              // Get.to(SizeChartScreen(
                              //   appbarTitle: "Return Policy",
                              // ));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  border: Border.all(
                                      width: 1, color: Colors.orangeAccent)),
                              child: const Text(
                                "View Policy",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.orangeAccent, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          // const Icon(Icons.book_sharp),
                          Image.asset(
                            "images/003-return-box.png",
                            height: 18,
                            width: 18,
                            // fit: BoxFit.fill,
                          ),
                          const SizedBox(width: 5),
                          CustomText(
                              text: "Return within 7 Days",
                              fontSize: 12,
                              color: Colors.black54)
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset(
                            "images/004-repair.png",
                            height: 20,
                            width: 20,
                            // fit: BoxFit.fill,
                          ),
                          const SizedBox(width: 5),
                          CustomText(
                              text: "Damage/Wrong Product",
                              fontSize: 12,
                              color: Colors.black54)
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset(
                            "images/003-return-box.png",
                            height: 20,
                            width: 20,
                            // fit: BoxFit.fill,
                          ),
                          const SizedBox(width: 5),
                          CustomText(
                              text: "Quality Product",
                              fontSize: 12,
                              color: Colors.black54)
                        ],
                      ),
                      ////////////////////////////////////////////////////////////////////////////  contact us
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      CustomText(
                        text: "Need Help (contact us)",
                        fontweight: FontWeight.w400,
                        // color: Colors.blue,
                        fontSize: 18,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Image.asset(
                            "images/005-phone-receiver-silhouette.png",
                            height: 20,
                            width: 20,
                            // fit: BoxFit.fill,
                          ),
                          const SizedBox(width: 5),
                          CustomText(
                              text: "+91 9234692346",
                              fontSize: 12,
                              color: Colors.black54)
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            "images/008-email-1.png",
                            height: 20,
                            width: 20,
                            // fit: BoxFit.fill,
                          ),
                          const SizedBox(width: 5),
                          CustomText(
                              text: "info@futcart.com",
                              fontSize: 12,
                              color: Colors.black54)
                        ],
                      ),
                      ////////////////////////////////////////////////////////////     Delivery location and detail
                      // const Divider(
                      //   height: 25,
                      //   thickness: 1,
                      // ),
                      // CustomText(
                      //   text: "Delivery location",
                      //   fontweight: FontWeight.w400,
                      //   // color: Colors.blue,
                      //   fontSize: 18,
                      // ),
                      // const SizedBox(height: 10),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: SizedBox(
                      //         height: 50,
                      //         child: CustomTextfeild(
                      //           hintText: "Enter your PIN",
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 10),
                      //   ],
                      // ),
                      // const SizedBox(height: 10),
                      // Row(
                      //   children: [
                      //     const CircleAvatar(
                      //       backgroundColor: Colors.amber,
                      //       radius: 5,
                      //     ),
                      //     const SizedBox(width: 3),
                      //     CustomText(
                      //       text: "Expected delivery:- " "08-03-23",
                      //       color: Colors.black54,
                      //       fontSize: 12,
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 40)
                      /////////////////////////////////////////////////////////////    recommended product
                      // const Divider(
                      //   height: 25,
                      //   thickness: 1,
                      // ),
                      // CustomText(
                      //   text: "Recommended Product",
                      //   fontweight: FontWeight.w400,
                      //   // color: Colors.blue,
                      //   fontSize: 18,
                      // ),
                      // const SizedBox(height: 10),
                      // SizedBox(
                      //   height: 200,
                      //   child: ListView.separated(
                      //     // physics: NeverScrollableScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     shrinkWrap: true,
                      //     itemCount: 4,
                      //     itemBuilder: (buidcontext, index) {
                      //       return InkWell(
                      //         onTap: () {},
                      //         child: const CircleAvatar(
                      //           radius: 12,
                      //           backgroundColor: Colors.brown,
                      //         ),
                      //       );
                      //       // return ProductTile();
                      //     },
                      //     separatorBuilder: (BuildContext context, int index) {
                      //       return const SizedBox(width: 6);
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              //   child: Row(
              //     children: [
              //       IconButton(
              //         onPressed: () {},
              //         icon: const Icon(
              //           Icons.favorite_border,
              //           size: 30,
              //         ),
              //       ),
              //       const SizedBox(width:5),
              //       Expanded(
              //         child: Container(
              //             height: 40,
              //             decoration: const BoxDecoration(
              //                 color: Colors.redAccent,
              //                 borderRadius: BorderRadius.all(Radius.circular(3))),
              //             child: Center(
              //               child: CustomText(
              //                 text: "BUY NOW",
              //                 color: Colors.white,
              //                 fontweight: FontWeight.bold,
              //               ),
              //             )),
              //       )
              //     ],
              //   ),
              // )
            ],
          );
        }));
  }
}
