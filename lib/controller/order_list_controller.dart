import 'package:futkart/constants/url.dart';
import 'package:futkart/db/cart_db_model.dart';
import 'package:futkart/model/user_data_model.dart';
import 'package:futkart/services/helper.dart';
import 'package:get/get.dart';

import '../model/order_list_model.dart';
import '../services/order_service.dart';

class OrderListController extends GetxController {

  var isLoading = true.obs;
  RxList<OrderListModel> orderList = (List<OrderListModel>.of([])).obs;
  String uId = "";
  

  @override
  void onInit() {
    // TODO: implement onInit
    // Helper.getUserIdData().then((id) {
    //   return getOrderList(id);
    // });
    getdata();
    // getOrderList("77");
    super.onInit();
  }
   void getdata()async {
    String uid = await Helper.getUserIdData();
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< object >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(uid);
    uId=uid;
    getOrderList(uid);
  }


  void getOrderList(String userId) async {
    print("/////////////////////////////////////////////////////////////////////////");
    print("order list controller called");
    isLoading(true);
    try{
      var product = await OrderService.getOrderList(userId);
      // print(product!.length);
    if (product != null){
      orderList.value = product;
    }
    }
    finally {
      isLoading(false);
    }
  }





  void createOrder(String userId, UserDataModel userData, List<CartDBModel> cartData, String transId) async {
    print("/////////////////////////////////////////////////////////////////////////");
    print("create order controller called");
    isLoading(true);
    try{
      OrderService.createOrder(userId, userData, cartData, transId).then((value) {
        getOrderList(userData.id.toString());
      });    }
    finally {
      isLoading(false);
    }
  }


  void cancleOrder(String orderId, String status) async {
    print("/////////////////////////////////////////////////////////////////////////");
    print("cancle order controller called");
    isLoading(true);
    try{
      OrderService.cancleOrder(orderId,status).then((value) {
        getOrderList(uId);
      });    }
    finally {
      isLoading(false);
    }
  }
  


}