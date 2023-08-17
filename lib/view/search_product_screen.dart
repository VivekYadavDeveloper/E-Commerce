import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:futkart/controller/product_list_controller.dart';
import 'package:futkart/view/constant/color.dart';
import 'package:get/get.dart';

import 'widgets/product_tile.dart';

class SerachProductScreen extends StatefulWidget {
  const SerachProductScreen({super.key});

  @override
  State<SerachProductScreen> createState() => _SerachProductScreenState();
}

class _SerachProductScreenState extends State<SerachProductScreen> {

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchCon = TextEditingController();
    final ProductListController productListController =
        Get.put(ProductListController());
    bool noData = true;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: TextField(
            controller: _searchCon,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: false,
              hintText: "Search",
              suffixIcon: IconButton(
                  onPressed: () {
                    if (_searchCon.text != "") {
                      productListController.searchProduct(
                          1, 10, _searchCon.text.toString(), "", "", "", "asc");
                      // print("search");
                    }
                    // productListController.searchProduct(
                    //   1, 10, _searchCon.text, "", "", "", "asc"
                    // );
                  },
                  icon: const Icon(Icons.search, color: Colors.white)),
              hintStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Obx(() {
          if (productListController.searchLoading.value) return Center(child: CircularProgressIndicator());
          return (productListController.searchProductList.length == 0) ? const Center(child: Text("")) :
          AlignedGridView.count(
            itemCount: productListController.searchProductList.length,
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            itemBuilder: (BuildContext context, int index) {
              return ProductTile(
                  product: productListController.searchProductList[index]);
            },
          );
        }));
  }
}
