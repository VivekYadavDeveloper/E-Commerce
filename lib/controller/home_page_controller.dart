import 'package:futkart/model/category_list_model.dart';
import 'package:futkart/services/product_service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {

  var isLoading = true.obs;
  var bannerLoading = true.obs;
  RxList<CategoryListModel> productList = (List<CategoryListModel>.of([])).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProductCategory();
    super.onInit();
  }

  void fetchProductCategory() async {
    print("controller is called");
    isLoading(true);
    try{
      var product = await ProductService.productCateroryList();
      print(product!.length);
    if (product != null){
      productList.value = product;
    }
    }
    finally {
      isLoading(false);
    }
  }

  void fetchHomeBanner() async {
    print("Banner controller called");
    bannerLoading(true);
    try{
      var product = await ProductService.productCateroryList();
      print(product!.length);
      if (product != null){
        productList.value = product;
      }
    }
    finally {
      bannerLoading(false);
    }
  }

}