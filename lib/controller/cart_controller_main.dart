import 'package:futkart/model/cart_model.dart';
import 'package:futkart/services/cart_services.dart';
import 'package:get/get.dart';

class CartMainController extends GetxController {

  var isLoading = true.obs;
  RxList<CartModel> cartitemList = (List<CartModel>.of([])).obs;

  //////////////////////////////////////////////////////////    get cart item
  void getcart() async {
    print("controller is called");
    isLoading(true);
    try{
      var product = await CartServices.getCartItemList();
      print(product!.length);
    if (product != null){
      cartitemList.value = product;
      // productList.assignAll(product);
    }
    }
    finally {
      isLoading(false);
    }
  }


  void addItemtocart() async {
    print("add Item to cart controller is called");
    isLoading(true);
    try{
      var product = await CartServices.addItemToCart();
      print(product!.length);
    if (product != null){
      cartitemList.value = product;
      // productList.assignAll(product);
    }
    }
    finally {
      isLoading(false);
    }
  }
  
}
