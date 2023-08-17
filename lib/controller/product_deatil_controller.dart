import 'package:futkart/model/product_detail_model.dart';
import 'package:futkart/services/product_service.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  // int? productId;
  var isLoading = true.obs;
  // ProductDetailController(this.productId);
  // RxList<ProductListModel> productList = (List<ProductListModel>.of([])).obs;
  var aproduct = DetailProductModel().obs;
  
  // final Rx<DetailProductModel> aproduct = (DetailProductModel).obs as Rx<DetailProductModel>;
  

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   fetchSingleProduct();
  //   super.onInit();
  // }

  void fetchSingleProduct(int prodId) async {
    print("/////////////////////////////////////////////////////////////////////////");
    print("fetch single product controller is called");
    isLoading(true);
    try{
      var product = await ProductService.getSingleProduct(prodId);
      // print(product!.length);
    if (product != null){
      aproduct.value = product;
    }
    }
    finally {
      isLoading(false);
    }
  }
}