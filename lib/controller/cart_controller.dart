import 'package:futkart/db/cart_db_model.dart';
import 'package:futkart/db/db_helper.dart';
import 'package:futkart/db/db_helper_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // var user = DbHelperModel().obs;
  var isLoading = true.obs;
  var removeLoading = true.obs;
  RxDouble totalAmount = 0.0.obs;
  RxList<CartDBModel> cartList = (List<CartDBModel>.of([])).obs;
  // String jsonUser = jsonEncode(cartList);

  @override
  void onInit() {
    // TODO: implement onInit
    // getCart();
    // totalCart();
    super.onInit();
  }



  void addToCart(
      String pId,
      String pName,
      String pCartSize,
      String pQuantity,
      String pPrice,
      String pImgurl
    ) async {
    print(
        "/////////////////////////////////////////////////////////////////////////");
    print("add to cart controller is called");
    DbHelper.dbhelper.insertCartData(
        {
          DbHelper.cartProductId: pId, 
          DbHelper.cartProductName: pName,
          DbHelper.cartProductCartonSize: pCartSize,
          DbHelper.cartProductQuantity: pQuantity,
          DbHelper.cartProductPrice: pPrice,
          DbHelper.cartProductImgUrl: pImgurl,
        }).then((value) {
          totalCart();
      print("data added");
    }).onErorr((error, stackTrace) {
      print(error.toString());
    });
  }

  void getCart() async {
    print(
        "/////////////////////////////////////////////////////////////////////////");
    print("get cart controller is called");
    isLoading(true);
    try {
      var datac = await DbHelper.dbhelper.getCartData();
      cartList.value = datac;
      totalAmount.value=0.0;
      totalCart();
       print(datac);

    } 
    finally {
      isLoading(false);
    }
    // data = DbHelperModel.fromJson(data as Map<String, dynamic>) as List<Map<String, dynamic>>;
  }



  void removeCart(String id) async {
    print("/////////////////////////////////////////////////////////////////////////");
    print("remove item cart controller is called");
    removeLoading(true);
    try {
      var datac = await DbHelper.dbhelper.deleteCartData(id);
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      print(datac);
      totalAmount.value=0.0;
      getCart();

      
    } 
    finally {
      removeLoading(false);
    }
    // data = DbHelperModel.fromJson(data as Map<String, dynamic>) as List<Map<String, dynamic>>;
  }


  void deleteCartTable() async {
    print("/////////////////////////////////////////////////////////////////////////");
    print("delete cart table controller is called");
    removeLoading(true);
    try {
      var datac = await DbHelper.dbhelper.deleteCartTable();
      totalAmount.value=0.0;
      getCart();
    } 
    finally {
      removeLoading(false);
    }
  }



   void totalCart(){
    double a=0.0;
   for(int a=0; a <= cartList.length; a++){
    double price = double.parse(cartList[a].product_price!) * int.parse(cartList[a].quantity!);
     totalAmount.value = totalAmount.value + price;
    // a=(a+price) as int;
   }
  //  totalAmount.value = a;
  //  double total = totalAmount.value * 0.16;
  //  totalAmount.value = total;
    // totalAmount.value = totalAmount.value + 100;
    // totalAmount.value = (totalAmount.value)*(112/100); 
  }



}
