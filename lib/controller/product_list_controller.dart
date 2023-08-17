import 'package:flutter/material.dart';
import 'package:futkart/model/category_product_list_model.dart';
import 'package:futkart/services/product_service.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {

  var isLoading = true.obs;
  var isRecentLoading = true.obs;
  var isAddLoading = false.obs;
  var searchLoading = true.obs;
  RxList<CategoryProductListModel> searchProductList = (List<CategoryProductListModel>.of([])).obs;
  RxList<CategoryProductListModel> recentProductList = (List<CategoryProductListModel>.of([])).obs;
  var productList = List<CategoryProductListModel>.empty(growable: true).obs;


  @override
  void onInit() {
    // TODO: implement onInit
    // fetchProduct();
    super.onInit();
  }

  //////////////////////////////////////////////////////////    fetch product first time
  void fetchProduct(int prodCat) async {
    print("controller is called");

    isLoading(true);
    productList.clear();
    try{
      var product = await ProductService.categoryProductList(prodCat);
      print(product!.length);
    if (product != null){
      // productList.value = product;
      productList.assignAll(product);
    }
    }
    finally {
      isLoading(false);
    }
  }

  
  //////////////////////////////////////////////////////////    product pagination
  // void addItem(int prodCat, int start) async {
  //   try{
  //     isAddLoading(true);
  //     // var response = await ProductService.addItemToProductList(start);
  //     // if(response.statusCode == 200){
  //     //   List<CategoryProductListModel> items = itemFromJson(response.body);
  //     //   itemList.addAll(items);
  //     // }
  //     var product = await ProductService.addItemToProductList(prodCat,start);
  //     print(product!.length);
  //   if (product != null){
  //     // productList.value = product;
  //     // productList.assignAll(product);
  //     productList.addAll(product);
  //   }
  //   }
  //   finally{
  //     isAddLoading(false);
  //   }
  // }

  //////////////////////////////////////////////////////////    fetch product first time
  void addItem(
    int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String sortOrder
    ) async {
    print("filter product controller called");

    isAddLoading(true);
    // productList.clear();
    try{
      var product = await ProductService.filterProductList(
        pageNumber,
        pageSize,
        strSearch,
        tagName,
        categoryId,
        sortBy,
        sortOrder
      );
      print(product!.length);
    if (product != null){
      // productList.value = product;
      productList.addAll(product);
    }
    }
    finally {
      isAddLoading(false);
    }
  }


















  //////////////////////////////////////////////////////////    product pagination
  // void addFilterItem(
  //   int pageNumber,
  //   int pageSize,
  //   String strSearch,
  //   String tagName,
  //   String categoryId,
  //   String sortBy,
  //   String sortOrder
  // ) async {
  //   try{
  //     isAddLoading(true);
  //     // var response = await ProductService.addItemToProductList(start);
  //     // if(response.statusCode == 200){
  //     //   List<CategoryProductListModel> items = itemFromJson(response.body);
  //     //   itemList.addAll(items);
  //     // }
  //     var product = await ProductService.addFilterItemToProductList(
  //       pageNumber,
  //       pageSize,
  //       strSearch,
  //       tagName,
  //       categoryId,
  //       sortBy,
  //       sortOrder
        
  //     );
  //     print(product!.length);
  //   if (product != null){
  //     // productList.value = product;
  //     // productList.assignAll(product);
  //     productList.addAll(product);
  //   }
  //   }
  //   finally{
  //     isAddLoading(false);
  //   }
  // }


  //////////////////////////////////////////////////////////    fetch product first time
  void filterProduct(
    int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String sortOrder
    ) async {
    print("filter product controller called");

    isLoading(true);
    productList.clear();
    try{
      var product = await ProductService.filterProductList(
        pageNumber,
        pageSize,
        strSearch,
        tagName,
        categoryId,
        sortBy,
        sortOrder
      );
      print(product!.length);
    if (product != null){
      productList.value = product;
      // productList.assignAll(product);
    }
    }
    finally {
      isLoading(false);
    }
  }



    //////////////////////////////////////////////////////////    fetch recent product time
  void fetchRecentProduct(
    int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String sortOrder
    ) async {
    print("filter product controller called");

    isLoading(true);
    try{
      var product = await ProductService.filterProductList(
        pageNumber,
        pageSize,
        strSearch,
        tagName,
        categoryId,
        sortBy,
        sortOrder
      );
      print(product!.length);
    if (product != null){
      recentProductList.value = product;
    }
    }
    finally {
      isLoading(false);
    }
  }


  ////////////////////////////////////////////////////////    search product
  //   void searchProduct(
  //   int pageNumber,
  //   int pageSize,
  //   String strSearch,
  //   String tagName,
  //   String categoryId,
  //   String sortBy,
  //   String sortOrder
  //   ) async {
  //   print("search product controller called");

  //   searchLoading(true);
  //   searchProductList.clear();
  //   try{
  //     var product = await ProductService.addFilterItemToProductList(
  //       pageNumber,
  //       pageSize,
  //       strSearch,
  //       tagName,
  //       categoryId,
  //       sortBy,
  //       sortOrder
  //     );
  //     print(product!.length);
  //   if (product != null){
  //     searchProductList.value = product;
  //     // productList.assignAll(product);
  //   }
  //   }
  //   finally {
  //     searchLoading(false);
  //   }
  // }
    void searchProduct(
    int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String sortOrder
    ) async {
    print("filter product controller called");

    searchLoading(true);
    searchProductList.clear();
    try{
      var product = await ProductService.filterProductList(
        pageNumber,
        pageSize,
        strSearch,
        tagName,
        categoryId,
        sortBy,
        sortOrder
      );
      print(product!.length);
    if (product != null){
      searchProductList.value = product;
      // productList.assignAll(product);
    }
    }
    finally {
      searchLoading(false);
    }
  }









  //  void paginationProduct(
  //   int pageNumber,
  //   int pageSize,
  //   String strSearch,
  //   String tagName,
  //   String categoryId,
  //   String sortBy,
  //   String sortOrder
  //   ) async {
  //   print("pagination controller called");

  //   isLoading(true);
  //   productList.clear();
  //   try{
  //     var product = await ProductService.filterProductList(
  //       pageNumber,
  //       pageSize,
  //       strSearch,
  //       tagName,
  //       categoryId,
  //       sortBy,
  //       sortOrder
  //     );
  //     print(product!.length);
  //   if (product != null){

  //     for (var element in _productsDataModel!.data!.products!) {
  //       productdataList.add(element);
  //     }
  //     productList.value = product;
  //     // productList.assignAll(product);
  //   }
  //   }
  //   finally {
  //     isLoading(false);
  //   }
  // }



  //  Future<void> getProductData({String? pageUrl, bool isPaginatHit = false}) {
  //   return ApiServices.getProductData(pageUrl: pageUrl!)
  //       .then((ProductsDataModel? response) {
  //     productLoding(true);
  //     _productsDataModel = response!;
  //     productnextPageUrl(response.data!.pagination!.nextPageUrl ?? "");
  //     if (!isPaginatHit) {
  //       productdataList.clear();
  //     }
  //     for (var element in _productsDataModel!.data!.products!) {
  //       productdataList.add(element);
  //     }
  //   }).catchError((err) {
  //     log(err, name: "Booking API", time: DateTime.now(), zone: Zone.current);
  //     return err;
  //   }).whenComplete(() => productLoding(false));
  // }



}